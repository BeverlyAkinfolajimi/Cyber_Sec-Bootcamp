#!/bin/bash

rm -rf /tmp/*
rm -rf /var/tmp/*

apt clean -y

rm -rf /home/sysadmin/.cache/thumbnails
rm -rf /home/instrutor/.cache/thumbnails
rm -rf /home/student/.cache/thumbnails
rm -rf /root/.cache/thumbnails

