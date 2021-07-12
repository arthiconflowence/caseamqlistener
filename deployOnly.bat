@ECHO OFF
:: This script takes the required parameters to deploy an API
TITLE Mule Jar Deployment using Maven


echo  #######################################
echo  #### Script to Deploy the Jar file ####
echo  #######################################


::  #### Setting the system paramters  ####
SET muleVersion="4.2.2"
SET userName="REPLACE_BY_USER"
SET password="REPLACE_BY_USER"
SET applicationName="REPLACE_BY_USER"
SET environment="REPLACE_BY_USER"
SET businessGroup="REPLACE_BY_USER"
SET visualizer="exp"
SET workerType="REPLACE_BY_USER"
SET clientId="REPLACE_BY_USER"
SET clientSecret="REPLACE_BY_USER"
SET workers="REPLACE_BY_USER"
SET region="REPLACE_BY_USER"

:: ##########Application parameters########
set amqCaseClientId="REPLACE_BY_USER"
set amqCaseClientSecret="REPLACE_BY_USER"
set encryptionKey="REPLACE_BY_USER"
:: ###################################

:: ########################MAVEN DEPLOY COMMAND#######################################
:: ##########################Get Artifact from target folder##########################
for /f %%i in ('DIR /b target\*.jar') do set artifact=%%i
set artifact=target/%artifact%


mvn mule:deploy -DmuleDeploy -Dmule.artifact=%artifact% -DmuleVersion=%muleVersion% -Dusername=%userName% -Dpassword=%password% -DapplicationName=%applicationName% -Denvironment=%environment% -DbusinessGroup=%businessGroup% -Danypoint.platform.visualizer.layer=%visualizer% -Dregion=%region% -Dworkers=%workers% -DworkerType=%workerType% -Danypoint.platform.client_id=%clientId% -Danypoint.platform.client_secret=%clientSecret% -DencryptionKey=%encryptionKey% -Danypoint-mq.client-secret=%amqCaseClientSecret% -Danypoint-mq.client-id=%amqCaseClientId%


PAUSE
