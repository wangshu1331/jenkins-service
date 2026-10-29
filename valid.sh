#验证 Jenkinsfile 是否存在语法错误
TOKEN=$(cat ./TOKEN)

echo "TOKEN is:${TOKEN}"
USER=root
JENKINS_URL=http://127.0.0.1:8080/

CRUMB=$(curl -s -u "$USER:$TOKEN" "$JENKINS_URL/crumbIssuer/api/json" | jq -r .crumb)
curl -s -w "\nHTTP:%{http_code}\n" -u "$USER:$TOKEN" -H "Jenkins-Crumb: $CRUMB" \
  -F "jenkinsfile=<Jenkinsfile" \
  "$JENKINS_URL/pipeline-model-converter/validate"