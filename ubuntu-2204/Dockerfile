FROM octopuslabs/workertools:latest-ubuntu.2204

ARG FLYWAY_VERSION=7.7.1

# Get JRE
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04
RUN apt-get update && apt-get install -y openjdk-11-jre-headless

# Get SQL Fluff for Flyway Check Command
RUN pip3 install sqlfluff==1.2.1

# Change the workdir to flyway to install flyway binaries
WORKDIR /flyway

# Install flyway
RUN curl -L https://download.red-gate.com/maven/release/org/flywaydb/enterprise/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1 \
  && rm flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  # Make the /flyway/flyway command an executable
  && chmod +x /flyway/flyway \
  # Make it so any user can call /flyway/flyway 
  && ln -s /flyway/flyway /usr/local/bin/flyway

# Octopus expects to start in the default directory
WORKDIR /
