#!/bin/sh

SCRIPTS_DIR=`dirname $0`
source "$SCRIPTS_DIR/isolate-arguments.sh"

echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo "STACK_SUFFIX: $STACK_SUFFIX"
echo "TARGET_ENVIRONMENT: $TARGET_ENVIRONMENT"
echo "IMAGE_TAG: $IMAGE_TAG"
echo "TARGET_REGION: $TARGET_REGION"
echo "NETWORK_STACK: $NETWORK_STACK"

sed -i '' "s|%%TargetEnvironment%%|$TARGET_ENVIRONMENT|" "$SCRIPTS_DIR/../parameters/IxoWebStack.parameters.json"
sed -i '' "s|%%ImageTag%%|$IMAGE_TAG|" "$SCRIPTS_DIR/../parameters/IxoWebStack.parameters.json"
sed -i '' "s|%%NetworkStackName%%|$NETWORK_STACK|" "$SCRIPTS_DIR/../parameters/IxoWebStack.parameters.json"

aws cloudformation create-stack --stack-name Ixo-App-Stack$STACK_SUFFIX --template-body file://templates/IxoWebStack.yaml  --parameters file://parameters/IxoWebStack.parameters.json --profile default --region $TARGET_REGION

git checkout "$SCRIPTS_DIR/../parameters/IxoWebStack.parameters.json"
