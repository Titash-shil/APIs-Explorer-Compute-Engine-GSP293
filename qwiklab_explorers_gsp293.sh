#!/bin/bash

# Define color variables
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'

# Define text formatting variables
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

clear


export REGION=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-region])")

# Fetching zone
export ZONE=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-zone])")

# Fetching project ID
PROJECT_ID=`gcloud config get-value project`

# Fetching project number
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")

# Instruction for instance creation

# Creating instance
gcloud compute instances create instance-1 \
  --project=$PROJECT_ID \
  --zone=$ZONE \
  --machine-type=n1-standard-1 \
  --image-family=debian-11 \
  --image-project=debian-cloud \
  --boot-disk-type=pd-standard \
  --boot-disk-device-name=instance-1

# Instruction for instance deletion

# Deleting instance
gcloud compute instances delete instance-1 \
  --project=$PROJECT_ID \
  --zone=$ZONE --quiet

# Completion message

echo -e "${BLUE_TEXT}${BOLD_TEXT}Subscribe my Channel (QwikLab Explorers):${RESET_FORMAT} ${GREEN_TEXT}${BOLD_TEXT}https://www.youtube.com/@qwiklabexplorers${RESET_FORMAT}"
