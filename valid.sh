JENKINS_URL=http://127.0.0.1:8080/
CRUMB=$(curl -s -u USER:TOKEN "$JENKINS_URL/crumbIssuer/api/xml?xpath=//crumb/text()")
curl -s -u USER:TOKEN -H "Jenkins-Crumb: $CRUMB" \
  -F "jenkinsfile=<Jenkinsfile" \
  "$JENKINS_URL/pipeline-model-converter/validate"