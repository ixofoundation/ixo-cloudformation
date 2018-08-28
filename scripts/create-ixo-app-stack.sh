#!/bin/sh

SCRIPTS_DIR=`dirname $0`
source "$SCRIPTS_DIR/isolate-arguments.sh"

echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo "STACK_SUFFIX: $STACK_SUFFIX"
echo "TARGET_REGION: $TARGET_REGION"
echo "NETWORK_STACK: $NETWORK_STACK"

sed -i '' "s|%%NetworkStackName%%|$NETWORK_STACK|" "$SCRIPTS_DIR/../parameters/IxoAppStack.parameters.json"

aws cloudformation create-stack --stack-name Ixo-App-Stack$STACK_SUFFIX --template-body file://templates/IxoAppStack.yaml  --parameters file://parameters/IxoAppStack.parameters.json --profile trustlab.cli --region $TARGET_REGION
