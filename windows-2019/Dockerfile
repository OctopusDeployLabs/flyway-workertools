# escape=`

FROM octopuslabs/workertools:latest-windows.2019
SHELL ["powershell", "-Command"]

ARG FLYWAY_VERSION=7.7.1

# # Install Flyway
RUN Invoke-WebRequest "https://download.red-gate.com/maven/release/org/flywaydb/enterprise/flyway-commandline/${env:FLYWAY_VERSION}/flyway-commandline-${env:FLYWAY_VERSION}-windows-x64.zip" -OutFile flyway-cli.zip; `
    & '.\Program Files\7-Zip\7z.exe' x .\flyway-cli.zip; `
    rm .\flyway-cli.zip;
   
RUN $old = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path).path; `
    Write-Host $old; `
    $flywayPath = ';C:\flyway-' + ${env:FLYWAY_VERSION}; `    
    $new = $old + $flywayPath; `
    Write-Host $new; `
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $new; `
    refreshenv