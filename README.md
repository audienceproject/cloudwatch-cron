# Create/Update CloudWatch cron event

A [Wercker](http://wercker.com/) step for creating or updating an AWS CloudWatch cron event. It will create the cron event if it does not exist or it will update it in case it already exists.
As a prerequisite, the [AWS Command Line Interface](https://aws.amazon.com/cli/) needs to be already configured with the details of a user which has sufficient _AWS Lambda_ management privileges.

The step takes several arguments:

* **label**: The name of the CloudWatch event. It is considered to be unique. There can be only one event with a certain name.
* **schedule**: A cron expression according to the documentation for `--schedule-expression` in the [AWS cli](http://docs.aws.amazon.com/cli/latest/reference/events/put-rule.html).
* **aws-account-id**: The AWS Account Id under which theLambda function needs to be published.
* **lambda-role**: The AWS IAM Role that needs to be associated with the Lambda function to control its execution privileges.
* **state**: Defaults to `ENABLED` if the cron should start right after it has been created, or `DISABLED` otherwise.
* **description**: Teh description of the cron.
* **targets**: The targets which are activated by the cron [AWS cli](http://docs.aws.amazon.com/cli/latest/reference/events/put-targets.html).

## Examples

```
steps:
    - audienceproject/cloudwatch-cron:
        label: run-backup
        schedule: rate(6 hours)
        description: Back up the users database via a Lambda function
        targets: arn:aws:lambda:us-east-1:123456789012:function:make-backup
```
