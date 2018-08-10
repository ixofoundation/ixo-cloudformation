#!/bin/bash -xe

STACK_SUFFIX="-$1"
if [ "$#" -ne 1 ]; then
    STACK_SUFFIX=""
fi

aws cloudformation create-stack --stack-name Ixo-App-Stack$STACK_SUFFIX --template-body file://templates/IxoAppStack.yaml  --parameters file://parameters/IxoAppStack.parameters.json --profile trustlab.cli --region us-east-1
