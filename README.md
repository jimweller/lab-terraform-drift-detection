# Terraform Drift Detection with Github Actions, Prototype/Demo

Demonstrates terraform drift detection using github actions

## Pre-requities
* An aws accounts, dev and prod
  * PROD is `AwsProfile`
* An IAM user in each accounts that can create and delete SSM parameters and access the S3 buckets used for state
  * This is using the `@iam_deploy_user` and assuming the `@iam_deploy_role` in each account. They are distinct IAM users per account.
* ACCESS_KEY and ACCESS_SECRET for each user in the respective accounts
  * The keys for `@iac_deploy_user` are in secrets manager in the acounts
* An s3 bucket in each account for tfstate
* The following values stored as github secrets in the repo
  * AWS_PROD_KEY - the AWS_ACCESS_KEY for prod account
  * AWS_PROD_SECRET - the AWS_SECRET_KEY for prod account
  * AWS_PROD_TFSTATE_S3 - the S3 bucket for terraform state for the prod account (`terraform-remote-state-201743370211-us-east-2`)
  * AWS_PROD_ROLE - the IAM role to assume in the prod account (`arn:aws:iam::504400329018:role/@iac_deploy_role`)

## How it Works
* Manually run the CI/CD workflow to deploy an ssm parameter to production
* When you run `source make-tf-drift.sh` the paramater will be made to differ from the tf state (using the aws CLI)
* When you manually run the workflow tf-drift-detection it will detect the drift, fail the workflow, and create a github issue
* You can repair the drift be re-running the CI/CD workflow manually


## Caveats
- This repo does not have branch protection to make it easier to demonstrate workflows
