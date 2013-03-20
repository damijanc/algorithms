drop procedure if exists purge_slow_queries;
drop procedure if exists purge_idle_connections;
drop event if exists auto_purge_slow_queries;
drop event if exists auto_purge_idle_connections;

delimiter //

create procedure purge_idle_connections()
deterministic
begin
    declare done boolean default false;
    declare max_time int default coalesce(@max_kill_time, 200);
    declare pid bigint;
    declare c cursor for
    SELECT id
    FROM information_schema.processlist
    WHERE command in ('Sleep')
        AND time > max_time;
    declare continue handler for not found
        set done = true;
    open c;
    set @q_kill = 'KILL ?';
    prepare q_kill from @q_kill;
    PURGELOOP: loop
        fetch c into pid;
        if done then
            leave PURGELOOP;
        end if;
        set @pid = pid;
        execute q_kill using @pid;
    end loop;
    deallocate prepare q_kill;
end//


create procedure purge_slow_queries()
deterministic
begin
    declare done boolean default false;
    declare max_time int default coalesce(@max_kill_time, 200);
    declare pid bigint;
    declare c cursor for
    SELECT id
    FROM information_schema.processlist
    WHERE state in ('executing')
        AND time > max_time;
    declare continue handler for not found
        set done = true;
    open c;
    set @q_kill = 'KILL ?';
    prepare q_kill from @q_kill;
    PURGELOOP: loop
        fetch c into pid;
        if done then
            leave PURGELOOP;
        end if;
        set @pid = pid;
        execute q_kill using @pid;
    end loop;
    deallocate prepare q_kill;
end//

delimiter ;

create event auto_purge_idle_connections
    on schedule every 10 second
    do call purge_idle_connections();

create event auto_purge_slow_queries
    on schedule every 10 second
    do call purge_slow_queries();
