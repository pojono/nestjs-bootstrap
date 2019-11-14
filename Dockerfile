FROM node:13.1.0-alpine
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn
COPY tsconfig.build.json .
COPY tsconfig.json .
COPY src ./src
RUN yarn build
CMD node dist/main
