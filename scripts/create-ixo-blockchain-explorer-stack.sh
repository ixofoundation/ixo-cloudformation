#!/bin/bash -xe

STACK_SUFFIX="-$1"
if [ "$#" -ne 1 ]; then
    STACK_SUFFIX=""
fi

aws cloudformation create-stack --stack-name Ixo-Blockchain-Explorer-Stack$STACK_SUFFIX --template-body file://templates/IxoBlockchainExplorerStack.yaml  --parameters file://parameters/IxoBlockchainExplorerStack.parameters.json --profile trustlab.cli --region eu-west-1
