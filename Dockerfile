FROM ubuntu:14.04 
MAINTAINER Ernesto Hernandez "ehdez73@gmail.com"

EXPOSE 9000
EXPOSE 9092
EXPOSE 8080

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# GIT
#####
RUN apt-get install -y git

# JAVA
############
# Auto-accept the Oracle JDK license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections; \
    apt-get install -y oracle-java8-installer

# Jenkins
#########
ADD http://mirrors.jenkins-ci.org/war/1.613/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

# Jenkins plugins
###################
ADD https://updates.jenkins-ci.org/download/plugins/git/2.3.5/git.hpi $JENKINS_HOME/plugins/git.hpi
ADD http://updates.jenkins-ci.org/download/plugins/git-client/1.17.1/git-client.hpi $JENKINS_HOME/plugins/git-client.hpi
ADD https://updates.jenkins-ci.org/download/plugins/scm-api/0.2/scm-api.hpi $JENKINS_HOME/plugins/scm-api.hpi
ADD https://updates.jenkins-ci.org/download/plugins/build-pipeline-plugin/1.4.3/build-pipeline-plugin.hpi $JENKINS_HOME/plugins/build-pipeline-plugin.hpi
ADD https://updates.jenkins-ci.org/download/plugins/parameterized-trigger/2.26/parameterized-trigger.hpi $JENKINS_HOME/plugins/parameterized-trigger.hpi
ADD https://updates.jenkins-ci.org/download/plugins/jquery/1.7.2-1/jquery.hpi $JENKINS_HOME/plugins/jquery.hpi
ADD https://updates.jenkins-ci.org/download/plugins/conditional-buildstep/1.3.3/conditional-buildstep.hpi $JENKINS_HOME/plugins/conditional-buildstep.hpi
ADD https://updates.jenkins-ci.org/download/plugins/run-condition/1.0/run-condition.hpi $JENKINS_HOME/plugins/run-condition.hpi 
ADD https://updates.jenkins-ci.org/download/plugins/token-macro/1.5.1/token-macro.hpi $JENKINS_HOME/plugins/token-macro.hpi 
ADD https://updates.jenkins-ci.org/download/plugins/gradle/1.24/gradle.hpi $JENKINS_HOME/plugins/gradle.hpi

# Maven Settings
################
ADD maven-settings.xml /root/maven-settings.xml

# Node & npm
#########################
RUN apt-get install -q -y nodejs npm; \
    ln -s /usr/bin/nodejs /usr/bin/node;

# grunt, gulp & bower
#########################
RUN npm install -g gulp grunt bower

# SONAR
########
ADD http://sourceforge.net/projects/sonar-pkg/files/deb/binary/sonar_5.1_all.deb/download /tmp/sonar_5.1_all.deb
RUN dpkg -i /tmp/sonar_5.1_all.deb; \
    rm /tmp/sonar_5.1_all.deb
ADD http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/javascript/sonar-javascript-plugin/2.6/sonar-javascript-plugin-2.6.jar /opt/sonar/extensions/plugins/sonar-javascript-plugin-2.6.jar

# Workaround until version 3.4 has been released: http://jira.sonarsource.com/browse/SONARJAVA-990
ADD sonar-java-plugin-3.4-SNAPSHOT.jar /opt/sonar/extensions/plugins/sonar-java-plugin-3.4-SNAPSHOT.jar


ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

ENTRYPOINT ["/root/run.sh"]
