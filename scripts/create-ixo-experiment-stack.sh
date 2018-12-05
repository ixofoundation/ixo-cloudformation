#!/bin/sh

SCRIPTS_DIR=`dirname $0`
source "$SCRIPTS_DIR/isolate-arguments.sh"

echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo "STACK_SUFFIX: $STACK_SUFFIX"
echo "TARGET_ENVIRONMENT: $TARGET_ENVIRONMENT"
echo "IMAGE_TAG: $IMAGE_TAG"
echo "TARGET_REGION: $TARGET_REGION"
echo "NETWORK_STACK: $NETWORK_STACK"

sed -i '' "s|%%TargetEnvironment%%|$TARGET_ENVIRONMENT|" "$SCRIPTS_DIR/../parameters/IxoWebWorldStack.parameters.json"
sed -i '' "s|%%ImageTag%%|$IMAGE_TAG|" "$SCRIPTS_DIR/../parameters/IxoWebWorldStack.parameters.json"
sed -i '' "s|%%NetworkStackName%%|$NETWORK_STACK|" "$SCRIPTS_DIR/../parameters/IxoWebWorldStack.parameters.json"

aws cloudformation create-stack --stack-name Ixo-Experiment-Stack$STACK_SUFFIX --template-body file://templates/IxoExperimentStack.yaml  --parameters file://parameters/IxoWebWorldStack.parameters.json --profile default --region $TARGET_REGION --capabilities CAPABILITY_IAM

git checkout "$SCRIPTS_DIR/../parameters/IxoWebWorldStack.parameters.json"
