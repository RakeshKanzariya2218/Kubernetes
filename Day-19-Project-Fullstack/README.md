#  Kubernetes Project # 

- Terraform_main_ec2 : 
  
  - change the key nane in variables
  - remove terraform.tf ( Backend block ) 
  - remove kubernetes.sh
  - change the rds version 

  - when  run terraform init,plan and apply then create complete network , rds and eks-client which is jumphost server 

- 2nd10weeks : 
 
  - remove mysql 
  - remove rds
----------------------------------------------------------------

- eks-terraform :
  - inside this jenkins pipeline is there for the create a eks cluster by terraform.
  - terraform_main_ec2 inside jumphost server will install all tool by userdata ( tools.sh )
  - so jenkins also installed and create cluster 

-------------------------------------------------------------------

- create frontend and backend ecr repositories. and pipelline  inside change  the push commands.


-------------------------------------------------------
- Jenkinsfile-Backend : 

- Build_Number means every jenkins run time number will increase so getting the unique image name (remove latest)


- sed command :

  - Automate update image ecr to github yml file 
  - linux sed command is work like update one file content to another file content 
  - so sed command is use for the update ecr image into github yaml files automatically 

  - jenkinsfile-backend : 
    
    - change url ecr backend 
    - change push commands

- connect jumphost server and access jenkins and create backend pipeline scrips from scm github 
- add git tocken in the jenkins inside credintial if repository is private
- script import from the github and add tocken jenkins 
- github inside kubernetes file - backend deployment.yaml inside change the image conunt 
- save apply and eun the pipeline 

------------------------------------------------------------
- Jenkinsfile-frontend : 

  - make all changes like backend pipeline 
  - go jenkins create pipeline and add tocken 
  - gi github - client- src- pages- config.js   inside change the route53 record name or the jumphost server public ip.
  - save apply and run pipeline 

-----------------------------------------------------------------

- AWS-RDS   copy endpint and github inside - kubernetes file -configmap.yaml inside change the endpoint.

---------------------------------------------------------------------

- Another server inside install argocd and access the argocd 
- create application give github repo url and path
- and fine argocd will deploy yaml file when changes will done in github repo 

----------------------------------------------------------------------

- Jumphost server inside vi test.sql copy form backend git repo and save  that.
- install mysql and run that script inside the rds 
- mysql -h <endpoint> -u admin -p srivardhan < test.sql  
- check mysql inside database create or not 

------------------------------------------------------------------

- final check the application running or not hit route53 records if it is not run then again build the pipelines and check 
- ok .