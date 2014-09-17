#!/bin/bash

## Target API of environment
cf api --skip-ssl-validation $1

### Login to environment with admin credentials
cf login -u admin -p $2 -o system -s console

#cf bind-security-group services operations development

### Bind New Security Group
cf bind-staging-security-group all_open
cf bind-running-security-group all_open

### Remove Default Security Group all_open
cf unbind-staging-security-group services
cf unbind-running-security-group services
cf delete-security-group services

### Logout of environment
cf lo