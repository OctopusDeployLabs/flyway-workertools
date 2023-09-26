$manifestDataRaw = Invoke-WebRequest "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/maven-metadata.xml"
$manifestData = [Xml]$manifestDataRaw

$latestFlywayVersion = $manifestData.metadata.versioning.latest

$workerToolsTags = Invoke-RestMethod "https://registry.hub.docker.com/v1/repositories/octopuslabs/flyway-workertools/tags"
$matchingTag = $workerToolsTags | Where-Object { $_.name -eq $latestFlywayVersion }

if ($null -ne $matchingTag)
{
    Write-Host "Docker container already has latest version of flyway"
}
else
{
    Write-Host "We need to upgrade the flyway container to $latestFlywayVersion"
}