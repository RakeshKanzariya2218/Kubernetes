# PagerDuty 

1. Go to the PagerDuty website: https://www.pagerduty.com/.
2. Log in to your PagerDuty account using your credentials.

- create a new service and give credintials 
  integration - events api v2 (select)  and create the service

- go to service direcctory and integration
  copy the integration key 
  - This key is unique to the service you just created and will be used in Grafana to send alerts to PagerDuty

- Use the Integration Key in Grafana
  - Now that you have the integration key, go back to Grafana and use it to set up the PagerDuty notification channel as I outlined earlier

# grafana 
  - create contact point 
  
  - alerting 
  - contact points 
  - give name - type=pagerduty 
  - enter itegration keey 
  - save contact point 
  ---------------------------------------
  - create alert rule
  
  - alerting 
  - alert rule 
  - cretate 
  - give name=high cpu alert 
  - add query 

   100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

  - set condition above 95% 
  - duration=1 min 
  - notification = pagerduty alert 
  - save alert rule.
---------------------------------------
- create new aler policy and then test the alert system 
- sterss command run inside the any cluster nodes and test 
  sudo yum install -y stress   # For Amazon Linux / RHEL
  sudo apt-get install -y stress # For Ubuntu

  stress --cpu 2 --timeout 300s

-----------------------------------------

  - pager duty login email is myyahoo email is working for free tier testing 
  - if you are getting notification through email then working properly . 

