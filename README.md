# GymSupport

DB Initialization:
1. Download gym_support.sql in a temp folder (e.g. C:\temp\)
2. Go to C:\..\PostgreSQL\9.4\bin
3. Open command window here (Shift _ RClick)
4. run: createdb -h localhost -p 5432 -U postgres -E utf8 gym_support
5. run: psql -h localhost -p 5432 -U postgres -d gym_support -f c:\temp\gym_support.sql
6. OPTIONAL - connect to localhost with pgAdmin and administer gym_support DB
