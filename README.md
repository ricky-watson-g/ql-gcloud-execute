# ql-gcloud-execute
Executes gcloud commands using lab permissions.  For when deployment manager rights are an issue.  An example would be for setting project IAM permissions.

This image is for use with qwiklabs, during initial lab deployment with deployment manager. It's used within a CloudBuild configuration.

## Usage: CloudBuild configuration

```
resources:
- name: build-something
  action: gcp-types/cloudbuild-v1:cloudbuild.projects.builds.create
  metadata:
    runtimePolicy:
    - UPDATE_ALWAYS
  properties:
    steps:
    - name: registry.hub.docker.com/gcptraining/ql-cloudbuild-gcloud:1.0
      args:
      - {{ env['project'] }}
      - {{ properties['region'] }}
      - {{ properties['zone'] }}
      - {{ properties['key_file'] }}
      - compute
      - instances
      - list
    timeout: 120s

```
