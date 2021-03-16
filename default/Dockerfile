FROM ubuntu:18.04

ARG Powershell_Version=7.0.3\*
ARG Octopus_Cli_Version=7.4.1
ARG Dotnet_Sdk_Version=3.1.401-1
ARG FLYWAY_VERSION=7.7.0

# get `wget` & software-properties-common
# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7#ubuntu-1804
RUN apt-get update && \
    apt-get install -y wget unzip apt-utils curl software-properties-common

# get powershell for 18.04
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    add-apt-repository universe && \
    apt-get install -y powershell=${Powershell_Version}

# Get Octo CLI
# https://octopus.com/downloads/octopuscli#linux
RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg curl ca-certificates apt-transport-https && \
    curl -sSfL https://apt.octopus.com/public.key | apt-key add - && \
    sh -c "echo deb https://apt.octopus.com/ stable main > /etc/apt/sources.list.d/octopus.com.list" && \
    apt-get update && \
    apt-get install -y octopuscli=${Octopus_Cli_Version}

# Get .NET SDK 3.1
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-1804
RUN apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dotnet-sdk-3.1=${Dotnet_Sdk_Version}

# Get JRE
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04
RUN apt-get install -y openjdk-11-jre-headless

WORKDIR /flyway

RUN curl -L https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1 \
  && rm flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && chmod +x /flyway/flyway \
  && ln -s /flyway/flyway /usr/local/bin/flyway

WORKDIR /