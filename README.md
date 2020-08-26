# Quick GCP Cloud Build CI pipeline to makes a Terraform Docker artifact in GCR.IO.

From CLOUD SHELL or your local SDK or a Build Trigger in Cloud Build.

<b>Clone this repo:</b><br>
$ git clone https://github.com/sveronneau/cloudbuild-terraform <br>
$ cd cloudbuild-terraform

<b>Mandatory:</b><br>
* Make sure you have a secret setup in Secret Manager that contains the JSON value of a Service Account with Project Editor role.<br>
* Update the <i>Variables</i> to fit your requirements.

<b>Enable the Cloud Build API:</b><br>
* Go in CloudBuild UI and enable it https://console.cloud.google.com/cloud-build <br>

<b>Make sure the CloudBuil service account something@cloudbuild.gserviceaccount.com as the folowing roles:</br></b>
* Cloud Build Service Account<br>
* Compute Admin<br>
* Secret Manager Secret Accessor

<b>Launch the cloud Build job:</b><br>
$ gcloud builds submit --config cloudbuild.yaml .

# Setting up a Service Account and Secret Manager<br>
* In GCP, go to https://console.cloud.google.com/iam-admin/serviceaccounts and create a Service Account with Project Editor role.  Then create a key and download the JSON version.<br>
* in GCP, go to https://console.cloud.google.com/security/secret-manager and create a secret and upload the JSON file from the previous step for content.

# Variables<br>
<b>Dockerfile:</b><br>
FROM alpine:<i>version</i><br>
ARG TF_VERSION=<i>Terraform version</i><br>
ARG TF_VERSION_SHA256SUM=<i>SHA256SUM value from https://releases.hashicorp.com/terraform/x.x.x/terraform_x.x.x_SHA256SUMS</i>

<b>cloudbuild.yml</b><br>
_TF_VERSION:<i>Same as Dockerfile</i><br>
_TF_VERSION_SHA256SUM: <i>Same as Dockerfile</i><br>
SECRET_MANAGER_NAME: <i>Name of the secret you created in GCP Secret Manager</i>
