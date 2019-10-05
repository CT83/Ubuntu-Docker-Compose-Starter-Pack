FROM ubuntu:latest

COPY . ./start_script.sh
RUN ["chmod", "+x", "start_script.sh"]

ENTRYPOINT ["sh","./start_script.sh"]