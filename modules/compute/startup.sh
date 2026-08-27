#!/bin/bash
set -eux
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx