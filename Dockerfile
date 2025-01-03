# Use a node image as the base
FROM node:20 as base

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Platform = ios 
# local Stage
FROM base as local-ios
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:local:ios"]

# dev Stage
FROM base as dev-ios
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:dev:ios"]

# preprod Stage
FROM base as preprod-ios
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:preprod:ios"]

# prod Stage
FROM base as prod-ios
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:prod:ios"]

# Platform = android
# local Stage
FROM base as local-android
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:local:android"]

# dev Stage
FROM base as dev-android
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:dev:android"]

# preprod Stage
FROM base as preprod-android
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:preprod:android"]

# prod Stage
FROM base as prod-android
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:prod:android"]

# Platform = web
# local Stage
FROM base as local-web
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:local:web"]

# dev Stage
FROM base as dev-web
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:dev:web"]

# preprod Stage
FROM base as preprod-web
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:preprod:web"]

# prod Stage
FROM base as prod-web
COPY ./src ./src
EXPOSE 8081
CMD ["npm", "run", "start:prod:web"]
