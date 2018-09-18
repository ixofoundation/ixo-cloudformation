#!/bin/sh

SCRIPTS_DIR=`dirname $0`
source "$SCRIPTS_DIR/isolate-arguments.sh"

if [ "$TARGET_ENVIRONMENT" == "sdgfutures" ];
then
  IMAGE_TAG=dev
fi

echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo "STACK_SUFFIX: $STACK_SUFFIX"
echo "TARGET_ENVIRONMENT: $TARGET_ENVIRONMENT"
echo "IMAGE_TAG: $IMAGE_TAG"
echo "TARGET_REGION: $TARGET_REGION"

sed -i '' "s|%%TargetEnvironment%%|$TARGET_ENVIRONMENT|" "$SCRIPTS_DIR/../parameters/IxoWorldStack.parameters.json"
sed -i '' "s|%%ImageTag%%|$IMAGE_TAG|" "$SCRIPTS_DIR/../parameters/IxoWorldStack.parameters.json"
sed -i '' "s|%%NetworkStackName%%|$NETWORK_STACK|" "$SCRIPTS_DIR/../parameters/IxoWorldStack.parameters.json"

aws cloudformation create-stack --stack-name Ixo-World-Stack$STACK_SUFFIX --template-body file://templates/IxoWorldStack.yaml  --parameters file://parameters/IxoWorldStack.parameters.json --profile trustlab.cli --region $TARGET_REGION

git checkout "$SCRIPTS_DIR/../parameters/IxoWorldStack.parameters.json"
