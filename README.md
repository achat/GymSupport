# GymSupport

Required PostgreSQL Database. Instructions made for version 9.4. For a different version, you might need to customize some steps). 

DB Initialization :
1. Download gym_support.sql in a temp folder (e.g. C:\temp\)
2. Go to C:\..\PostgreSQL\9.4\bin
3. Open command window here (Shift _ RClick)
4. run: createdb -h localhost -p 5432 -U postgres -E utf8 gym_support
5. run: psql -h localhost -p 5432 -U postgres -d gym_support -f c:\temp\gym_support.sql
6. OPTIONAL - connect to localhost with pgAdmin and administer gym_support DB

CodeMR Analysis:
Project metrics, exported with CodeMR Community (via Eclipse). Download file and open in web browser:
1. For master branch:   CodeMR Analysis\GymSupportRefactored\html\main_report\index.html
2. For Pro branch:      CodeMR Analysis\GymSupportPro\html\main_report\index.html
3. For FreeDemo branch: CodeMR Analysis\GymSupportFree\html\main_report\index.html

Run Application:
Unzip: https://github.com/mai19079/GymSupport/blob/master/RunGymSupport.zip
Run GymSupport.jar
