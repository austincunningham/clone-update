# clone-update

bash script for cloning, forking ,creating remotes and pulling the latest master on all integr8ly 

# Prerequisites 

- git
- [hub](https://hub.github.com/) for forking

## Usage and installation

Clone this repo into an empty directory, chmod the script and run it 

```bash
$ git clone git@github.com:austincunningham/clone-update.git
$ chmod 775 cloneAll.sh
$ ./cloneAll.sh

```
Creates the repos in the following directory structure

```bash
.
..
tutorial-web-app
nodejs-messaging-work-queue
installation
managed-service-controller
managed-service-broker
integration-controller
walkthroughs
release
spboot-example
launcher-booster-catalog
walkthrough-operator
syndesis
openshift-resource-parser
docs-test01
installation-notes
```
