#!/bin/sh

# this script will change the ssm parameter value
# which will cause the tf-drive-detection github action
# to flag a drift.

# YOU MUST CALL THIS SCRIPT WITH 
#
#   source make-tf-drift.sh 
#
# because it wants to have assume and all the aliases
# and functions. It won't run in a nake shell.

assume AwsProfile/AWSAdministratorAccess

aws ssm put-parameter --overwrite --name /drift/detection --value CHANGED_OH_NO