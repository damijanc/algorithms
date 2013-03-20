purge_idle_connections.sql
------------------------------------------------------------
procedure that will inspect the database for long lasting connections and kill them automatically

Blog post: http://blog.cavar.si/2011/07/how-to-kill-long-lasting-connections-in.html


optimize_tables.sql
-----------------------------------------------------------
As everyone that uses mysql knows, cardinality of indexes and partitioning of table space is a problem, especially when having heavy usage database. The result are the declining performance of queries, in my case query took 15-16 second instead of 2. We could always do OPTIMIZE TABLE on a specific table, but I wanted a system solution.

Blog post: http://blog.cavar.si/2011/04/how-to-optimize-tables-in-mysql.html

