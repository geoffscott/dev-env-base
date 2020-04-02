# development-environment

Remote terminal development environment container image: tmux, SSH, ZSH, neovim, dot files

## Introduction

Sets up a remote terminal development environment that can be run in a container service, like a Google Compute Engine VM, and accessed via SSH (or Mosh).

Here's how it works:

![GCP Development Environment Diagram](https://docs.google.com/drawings/d/e/2PACX-1vTBKipEjbz2VFlT_V2myL3w5aUVU3xFPZxxteggBjKlFMH_4pZYZTY7Nq5b_TXRpyhJRzsCcbqRQgby/pub?w=960&h=720)

## Dockerfile to Setup the Environment

Start with a working openssh-server on Alpine

https://github.com/danielguerra69/alpine-sshd

If you want to run this, start by forking this repo and follow the setup steps below.

## Google Cloud Platform Setup

1. Create a GCP account, enable billing
2. Create a GCP project (your account will be an Owner, so you won't need additional roles)
3. Add trigger to your repo on Github
4. Enable OS Login on your project https://cloud.google.com/compute/docs/instances/managing-instance-access#add_oslogin_keys

### Builds

Opening and merging a PR will trigger a Google Cloud Build job.
If the build succeeds, the resulting image will be saved in Google Container Registry:

gcr.io/[YOUR PROJECT ID]/development-environment

### Running

Choose a version of the image from Google Container Registry
Right click on the three-dots
Select 'Deploy to GCE'

This will take you to Google Compute Engine and show the starting VM Instance that will run the development environment

## Setup SSH Keys

1. Install gcloud SDK on a local machine (only needed for step #6) https://gist.github.com/marcwjj/d86bc137a302b50d8c0f1b5af5fd19d5
2. SSH into remote instance using gcloud command to generate an SSH key pair and associate the public key with your account
3. Test your keys by connecting to the instance

ssh to the running image
reconnect to existing session using tmux

## Install Termius on Chrome OS

You can download and install the Android app on Chrome OS, but it doesn't appear to fully work. Instead, enable Linux and install the .deb version.

* enable Linux
* open terminal
$ wget https://www.termius.com/download/linux/Termius.deb
$ sudo apt install ./Termius.deb
$ termius-app

Import the private SSH key generated above into Termius
Create an Identity
Create a Host

