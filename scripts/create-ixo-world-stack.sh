#!/bin/bash -xe

STACK_SUFFIX="-$1"
if [ "$#" -ne 1 ]; then
    STACK_SUFFIX=""
fi

aws cloudformation create-stack --stack-name Ixo-World-Stack$STACK_SUFFIX --template-body file://templates/IxoWorldStack.yaml  --parameters file://parameters/IxoWorldStack.parameters.json --profile trustlab.cli --region eu-west-1
