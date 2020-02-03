#!/bin/bash
if [ $# -lt 5 ]
then
  echo "Missing one or more of the required arguments: PROJECT, REGION, ZONE, KEY"
  exit 1
fi
PROJECT=$1
REGION=$2
ZONE=$3
KEY=$4
shift 4
echo ${KEY} > /tmp/k_f.json
gcloud auth activate-service-account ${PROJECT}@${PROJECT}.iam.gserviceaccount.com --key-file=/tmp/k_f.json
gcloud config set project ${PROJECT}
gcloud config set compute/region ${REGION}
gcloud config set compute/zone ${ZONE}
# all other args are for gcloud
gcloud $*
