#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "You must enter exactly 4 command line arguments. One IBM Cloud API key, the name of the cluster, the region and the resource group"
fi

export IBMCLOUD_API_KEY=${1}
CLUSTER_NAME=\"${2}\"
REGION=\"${3}\"
RESOURCE_GROUP_NAME=\"${4}\"

# Substitute IBM Cloud API key and cluster name in terraform settings file
sed -i "s/ibmcloud_api_key=/ibmcloud_api_key=\"${IBMCLOUD_API_KEY}\"/g" /home/devops/src/settings/environment-ibmcloud.tfvars
sed -i "s/cluster_name=/cluster_name=${CLUSTER_NAME}/g" /home/devops/src/settings/environment-ibmcloud.tfvars
sed -i "s/registry_namespace=/registry_namespace=${CLUSTER_NAME}/g" /home/devops/src/settings/environment-ibmcloud.tfvars
sed -i "s/region=/region=${REGION}/g" /home/devops/src/settings/environment-ibmcloud.tfvars 
sed -i "s/resource_group_name=/resource_group_name=${RESOURCE_GROUP_NAME}/g" /home/devops/src/settings/environment-ibmcloud.tfvars 

/home/devops/src/runTerraform.sh --ibm -d -a