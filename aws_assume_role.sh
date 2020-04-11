#!/usr/bin/env bash

declare ROLE_ARN="${1}"
declare SESSION_NAME="${2}"

if [[ -z $SESSION_NAME ]]; then
    SESSION_NAME=$(openssl rand -hex 12)
fi

declare STS_OUTPUT=$(
  aws sts assume-role --role-arn $ROLE_ARN --role-session-name $SESSION_NAME
)

cat <<EOF
AWS_ACCESS_KEY_ID=$(echo $STS_OUTPUT | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo $STS_OUTPUT | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo $STS_OUTPUT | jq -r '.Credentials.SessionToken')
EOF
