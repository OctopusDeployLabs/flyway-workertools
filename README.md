# Flyway Worker Tools

This repository contains images that contain the tooling necessary to to use the execution container feature with Octopus Deploy when running commands using flyway.

- OpenJDK v11 Java runtime
- Flyway

The following images are built in this repo:

- Ubuntu 22.04
- Ubuntu 20.04 
- Windows 2022 

A new image will be built each time a new version of flyway is created.  The version numbers will be based on the version of the Flyway tool.

## Deprecated tags

Over time, certain tags will be deprecated, usually according to their mainstream support end date. New versions for any matching images will stop being maintained and pushed based on the end date shown.

Tag | End date
---------| ---------------
`windows.2019`| [Jan 9th, 2024](https://learn.microsoft.com/en-us/lifecycle/products/windows-server-2019)

## Support

Please consider this repository provided as is.  If there are any issues please do not contact support.
