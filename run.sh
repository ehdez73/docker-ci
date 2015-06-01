#!/bin/bash
# start sonar
/opt/sonar/bin/linux-x86-64/sonar.sh start

# start jenkins
java -jar /opt/jenkins.war 1>/var/log/jenkins.log 2>&1

