rem If the following command does not start the ScenarioBuilder, correct the JAVA_HOME path
echo ON 

rem Set these variables; comment out line to use default
set JAVA_HOME=..\amazon-corretto-8.442.06.1-windows-x64-jre
set QUERY_FILE=.\config\Main_queries_GLIMPSE-7p0.xml
set DATABASE=..\..\GCAM-Model\gcam-v7.0\output\database
set UNITS=.\config\units_rules.csv
set FAVORITES=.\config\favorite_queries_list.txt
set REGIONS=.\config\preset_regions_list.txt
set MAPS=.\map_resources\AllMapInfo

rem Checking JAVA_HOME setup
if not exist "%JAVA_HOME%"\bin\java.exe (
  echo JAVA_HOME setting needs to be fixed
  pause
  GOTO END
) 

set JAVA_JVM_PATH=%JAVA_HOME%\bin\server

set PATH=.;%JAVA_JVM_PATH%;%JAVA_HOME%;%JAVA_HOME%\bin;%PATH%

start java -jar ./GLIMPSE-ModelInterface.jar -q %QUERY_FILE% -o %DATABASE% -u %UNITS% -f %FAVORITES% -p %REGIONS% -m %MAPS%