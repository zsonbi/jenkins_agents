#!/bin/bash

# Download the agent JAR
echo "Downloading agent.jar..."
curl -sO "${JENKINS_URL}/jnlpJars/agent.jar"

# Run the agent
echo "Starting Jenkins agent..."
exec java -jar agent.jar \
  -url "${JENKINS_URL}" \
  -secret "${JENKINS_SECRET}" \
  -name "${JENKINS_AGENT_NAME}" \
  -webSocket \
  -workDir "/srv/services/jenkins-agent"
