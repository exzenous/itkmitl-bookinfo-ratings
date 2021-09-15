FROM node:16.8.0-alpine3.12
# Version must be as specific as possible

WORKDIR /usr/src/app/
# Home Directory of the container

COPY src/ /usr/src/app/
RUN npm install

EXPOSE 8080
# docker inspect ratings

CMD ["node", "/usr/src/app/ratings.js", "8080"]
# docker run -it --rm --entrypoint sh ratings
# --rm : remove from "docker ps -a"
# sh : override CMD