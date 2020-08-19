#/usr/bin/env bash

# get subID and tenantID
az account show --query "{subscriptionId:id, tenantId:tenantId}" | jq -r .subscriptionId > data.json

#\{
#  "subscriptionId": "",
#  "tenantId": ""
#}

#eval "$(az account show --query "{subscriptionId:id}" | jq -r '.subscriptionId | "export \(.Name | @sh)=\(.Value | @sh)"' <<<"$json")"


# This posits that you have successful logged into Azure via `az login`
AZURE_SUBSCRIPTION_ID=$(az account show --query "{subscriptionId:id}" | jq -r '.subscriptionId);

if [[ $? -eq 0 ]]; then
	export SUBSCRIPTION_ID=$SUBSCRIPTIONID;
	echo "Successfully exported your Azure SUBSCRIPTION_ID."
else
	echo "Failed to get or set your Azure SUBSCRIPTION_ID"
fi


export AZURE_SUBSCRIPTION_ID=$(az account show --query "{subscriptionId:id}" | jq -r .subscriptionId)
export AZURE_TENANT_ID=$(az account show --query "{tenantId:tenantId}" | jq -r .tenantId)