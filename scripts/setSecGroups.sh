#!/bin/bash

## Target API of environment
cf api --skip-ssl-validation $1

### Login to environment with admin credentials
cf login -u admin -p $2 -o system -s console

### Create Security Group and Associate with Org and Space
cf create-security-group services ~/Desktop/Content/sec-group.json
cf bind-security-group services operations development

### Bind New Security Group
cf bind-staging-security-group services
cf bind-running-security-group services

### Remove Default Security Group all_open
cf unbind-staging-security-group all_open
cf unbind-running-security-group all_open

### List Security Groups
cf security-groups
cf staging-security-groups
cf running-security-groups

### Logout of environment
cf lo