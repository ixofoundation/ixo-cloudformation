#!/bin/sh

SCRIPTS_DIR=`dirname $0`
source "$SCRIPTS_DIR/isolate-arguments.sh"

echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo "STACK_SUFFIX: $STACK_SUFFIX"
echo "TARGET_ENVIRONMENT: $TARGET_ENVIRONMENT"
echo "TARGET_REGION: $TARGET_REGION"

aws cloudformation create-stack --stack-name Ixo-Networking-Stack$STACK_SUFFIX --template-body file://templates/IxoNetworkingStack.yaml  --profile default --region $TARGET_REGION
