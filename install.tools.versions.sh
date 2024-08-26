#!/bin/bash

# Available versions: https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
export TOOL_KUBECTL_VERSION=1.23.15/2023-01-11
# Available versions: https://github.com/Azure/kubelogin/releases
export TOOL_KUBELOGIN_VERSION=0.0.27
# Available versions: https://github.com/helm/helm/releases
export TOOL_HELM_VERSION=3.10.0
# Available versions: https://github.com/codacy/helm-ssm/releases
export TOOL_HELM_SSM_VERSION=3.1.9
# Available versions: https://github.com/databus23/helm-diff/releases
export TOOL_HELM_DIFF_VERSION=3.9.9
# Available versions: https://github.com/helmfile/helmfile/releases
export TOOL_HELMFILE_VERSION=1.0.0-rc.4
# Available versions: https://github.com/weaveworks/eksctl/releases
export TOOL_EKSCTL_VERSION=0.113.0
# Available versions: https://github.com/mikefarah/yq/releases
export TOOL_YQ_VERSION=4.30.8
# export TOOL_YQ_VERSION=4.44.3 # Has issues with complicated patterns
# Available versions: https://mirror.openshift.com/pub/openshift-v4/clients/ocp
export TOOL_OC_VERSION=4.10.45
# Available versions: https://github.com/yannh/kubeconform/releases
export TOOL_KUBECONFORM_VERSION=0.5.0
# Available versions: https://github.com/hashicorp/terraform/releases
export TOOL_TF_VERSION=1.0.9
# Available versions: https://github.com/terraform-linters/tflint/releases
export TOOL_TFLINT_VERSION=0.20.3
# Available versions: https://github.com/terraform-docs/terraform-docs/releases
export TOOL_TFDOCS_VERSION=0.16.0
# Available versions: https://github.com/gruntwork-io/terragrunt/releases
export TOOL_TERRAGRUNT_VERSION=0.35.6
# Available versions: https://github.com/wagoodman/dive/releases
export TOOL_DIVE_VERSION=0.10.0
# Available versions: https://archive.apache.org/dist/maven/maven-3
export TOOL_MAVEN_VERSION=3.8.4
# Available versions: https://archive.apache.org/dist/groovy
export TOOL_GROOVY_VERSION=2.5.20
# Available versions: https://nodejs.org/en/download/releases
export TOOL_NODE_VERSION=16.19.1_function
# Available versions: https://github.com/stern/stern/releases
export TOOL_STERN_VERSION=1.24.0
# Available versions: https://github.com/derailed/popeye/releases
export TOOL_POPEYE_VERSION=0.21.3
# Available versions: https://github.com/derailed/k9s/releases
export TOOL_K9S_VERSION=0.32.5
# Available versions: https://github.com/runatlantis/atlantis/releases
export TOOL_ATLANTIS_VERSION=0.28.5
# Available versions: https://github.com/snyk/driftctl/releases
export TOOL_DRIFTCTL_VERSION=0.40.0
# Available versions: https://github.com/charmbracelet/gum/releases
export TOOL_GUM_VERSION=0.14.3
# Available versions: https://github.com/kubernetes/minikube/releases
export TOOL_MINIKUBE_VERSION=1.33.1
# Available versions: https://github.com/junegunn/fzf/releases
export TOOL_FZF_VERSION=0.54.3

SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))

source ${SCRIPT_PATH}/install.utils.sh

check_utils
