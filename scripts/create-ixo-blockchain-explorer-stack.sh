#!/bin/sh

SCRIPTS_DIR=`dirname $0`
source "$SCRIPTS_DIR/isolate-arguments.sh"

echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo "STACK_SUFFIX: $STACK_SUFFIX"
echo "TARGET_ENVIRONMENT: $TARGET_ENVIRONMENT"
echo "TARGET_REGION: $TARGET_REGION"
echo "NETWORK_STACK: $NETWORK_STACK"

sed -i '' "s|%%TargetEnvironment%%|$TARGET_ENVIRONMENT|" "$SCRIPTS_DIR/../parameters/IxoBlockchainExplorerStack.parameters.json"
sed -i '' "s|%%NetworkStackName%%|$NETWORK_STACK|" "$SCRIPTS_DIR/../parameters/IxoBlockchainExplorerStack.parameters.json"

aws cloudformation create-stack --stack-name Ixo-Blockchain-Explorer-Stack$STACK_SUFFIX --template-body file://templates/IxoBlockchainExplorerStack.yaml  --parameters file://parameters/IxoBlockchainExplorerStack.parameters.json --profile trustlab.cli --region $TARGET_REGION

git checkout "$SCRIPTS_DIR/../parameters/IxoBlockchainExplorerStack.parameters.json"
