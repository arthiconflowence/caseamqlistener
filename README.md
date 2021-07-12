# case-amq-listener

This project case-amq-listener which listens to case object data publised to Anypoint MQ by other modules and invokes respective APIs with the respective data retrieved from Anypoint MQ.The json payload is posted to process API.On successful request the message in Anypoint MQ is manually acknowleged.In case of any failure during the message is not acknowleged.And after 10 retries the messages in Anypoint MQ will be moved to deadletter queue.
For JIRA to SFDC Case update,this invokes the jira-sys-api to query the issue details from JIRA using the issue id.
# Prerequisite Setup

 - Create client application in Anypoint MQ if not created and copy the client id and client secret.
 - Encrypt client secret with encryptionKey and add client id and client secret to {env}-secure.yaml where env is LOCAL,DEV under respective property.
 - Create Below Queues if not created
        1) sfa-sfdc-case-queue
        2) sfa-sfdc-case-dlq
        3) sfa-sfdc-update-case-queue
        4) sfa-sfdc-update-case-dlq
        5) sfa-sfdc-case-update-jira-dlq
        6) sfa-sfdc-case-update-jira-queue
      
# Installation Instructions For Studio


- Clone the project using any Github client or Anypoint Studio Git plugin.
- Import the project into workspace.
- Modify LOCAL.yaml properties appropriately.
- Studio --> Right Click  on Project --> Run As --> Run Configurations , Navigate to Arguments tab, in VM arguments enter the following

           
           -M-Dmule.env=LOCAL
           -M-DencryptionKey=(use your encryptionKey) 
           -M-Danypoint.platform.gatekeeper=disabled
           -M-Danypoint-mq.client-secret=(Use Anypoint MQ Client Secret)
           -M-Danypoint-mq.client-id=(Use Anypoint MQ Client Id)
           
           
- Click on Apply Button.
- Run the project.

# Deployment Instructions For CH


- Runtime Manager :

   Use the following Maven command to deploy application to Cloud Hub, replace '**' with appropriate values
   
mvn clean package deploy -DskipMunitTests -DmuleDeploy -DmuleVersion=** -Dusername=** -Dpassword=** -DapplicationName=** -Denvironment=** -DbusinessGroup=** -DworkerType=** -Danypoint.platform.client_id=** -Danypoint.platform.client_secret=** -DencryptionKey=** -Danypoint-mq.client-secret=** -Danypoint-mq.client-id=**
