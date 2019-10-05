FROM ubuntu:latest

COPY . start_script.sh

RUN start_script.sh
