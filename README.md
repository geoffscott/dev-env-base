# development-environment

Remote terminal development environment container image: tmux, SSH, ZSH, neovim, dot files

## Introduction

Sets up a remote terminal development environment that can be run in a container service, like a Google Compute Engine VM, and accessed via SSH.

Here's how it works:

![GCP Development Environment Diagram](https://docs.google.com/drawings/d/e/2PACX-1vTBKipEjbz2VFlT_V2myL3w5aUVU3xFPZxxteggBjKlFMH_4pZYZTY7Nq5b_TXRpyhJRzsCcbqRQgby/pub?w=960&h=720)

## Dockerfile to Setup the Environment

Start with a working openssh-server on Alpine

https://github.com/danielguerra69/alpine-sshd

If you want to run this, start by forking this repo and follow the setup steps below.

## Google Cloud Platform Setup

https://cloud.google.com/compute/docs/instances/managing-instance-access#add_oslogin_keys
Enable the OS Login instance
Grant the necessary IAM roles - nothing to do here if you already have the Owner role.
Create an SSH key pair - use Termius to do this
Add custom SSH keys to user accounts

Create a GCP account, enable billing
Create a GCP project
Add trigger to your repo on Github

### Builds

Opening and merging a PR will trigger a Google Cloud Build job.
If the build succeeds, the resulting image will be saved in Google Container Registry:

gcr.io/[YOUR PROJECT ID]/development-environment

### Running

Choose a version of the image from Google Container Registry
Right click on the three-dots
Select 'Deploy to GCE'

This will take you to Google Compute Engine and show the starting VM Instance that will run the development environment

## Usage

ssh to the running image
reconnect to existing session using tmux

## Managing SSH Keys

To make things a little more interesting, I'm trying to setup my environment so that I can access it remotely via SSH from any device. So far, the only challenge I can find is generating and managing SSH keys. This is easy if you start with a Linux, Mac, or Windows machine, but I'm trying to do this from a Chrome OS machine without using Chrome OS's built-in Linux OS.

To generate and manage SSH keys:

* Termius is an SSH client that runs on multiple platforms, but it requires Chrome OS Linux to be enabled. It allows you to generate SSH keys and the commercial version securely synchronizes them across devices.
* Userify is a cloud platform provider that allows you to generate and manage SSH keys. Appears to be legit, but not sure how secure it is. Needs a separate SSH client.
* 

## Install Termius on Chrome OS

You can download and install the Android app on Chrome OS, but it doesn't appear to fully work. Instructions

* enable Linux
* open terminal
$ wget https://www.termius.com/download/linux/Termius.deb
$ sudo apt install ./Termius.deb
$ termius-app

