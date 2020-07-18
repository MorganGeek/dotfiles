#!/usr/bin/env bash
set -eo pipefail
vim --version H -1
rustc --version
npm --version
bats --version
octant version
kubectl version
zola --version
pip --version
pip3 --version
java -version
javac -version
ansible --version
terraform --version
hugo version
python --version
python3 --version
docker --version
openssl version
git --version
atlas-version G Version H -n 1

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk --version
tac --version H -n 1
k9s version
tfsec --version
aws-iam-authenticator version
stern --version
helm version
terragrunt --version
pre-commit --version
terraform-docs --version
tflint --version
eksctl version
