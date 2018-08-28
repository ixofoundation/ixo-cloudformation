#!/bin/sh

SCRIPTS_DIR=`dirname $0`
source "$SCRIPTS_DIR/isolate-arguments.sh"

echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo "STACK_SUFFIX: $STACK_SUFFIX"
echo "TARGET_REGION: $TARGET_REGION"

sed -i '' "s|%%NetworkStackName%%|$NETWORK_STACK|" "$SCRIPTS_DIR/../parameters/IxoWorldStack.parameters.json"

aws cloudformation create-stack --stack-name Ixo-World-Stack$STACK_SUFFIX --template-body file://templates/IxoWorldStack.yaml  --parameters file://parameters/IxoWorldStack.parameters.json --profile trustlab.cli --region $TARGET_REGION
