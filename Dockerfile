FROM node:18.17.1-alpine
WORKDIR /app/backend

RUN rm -rf node_modules

COPY package.json .
COPY yarn.lock .
RUN yarn install
RUN yarn global add @medusajs/medusa-cli@latest
COPY . .

COPY deploy.sh .
ENTRYPOINT ["sh", "./deploy.sh"]