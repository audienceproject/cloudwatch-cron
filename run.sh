#!/bin/bash

aws events put-rule --name $WERCKER_CLOUDWATCH_CRON_LABEL --schedule-expression "$WERCKER_CLOUDWATCH_CRON_SCHEDULE" --state $WERCKER_CLOUDWATCH_CRON_STATE --description "$WERCKER_CLOUDWATCH_CRON_DESCRIPTION"
