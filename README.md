## Synopsis
Use this Jenkinsfile to execute terraform modules using ansible playbook with dynamic user inputs for appropriate actions.

## Pre-requisites
Must have following packages on jenkins server:

```ansible 2.5 and terraform any version```

## Instructions
First copy the ansible playbooks and terraform codes to the Jenkins server.
Create a new Pipeline job and set the url for your SCM, which contains the Jenkinsfile.
