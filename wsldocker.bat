@echo off

rem cd /d D:\Users\Petr\Dropbox\scripts

rem WSL is working?
wsl -l

rem We have to install a Linux Distribution!
wsl --set-default-version 2

rem All the distributions installed and versions of WSL:
wsl -l -v

rem To enable Ubuntu with WSL 2:
wsl --set-version Ubuntu 2

rem And again:
wsl -l -v

rem Source: "https://medium.com/@fred.gauthier.dev/web-development-environment-with-wsl-2-and-docker-for-symfony-5860704e127a"
