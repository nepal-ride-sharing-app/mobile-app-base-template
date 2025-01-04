# Use a node image as the base
FROM node:20 as base

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all other content except node_modules
COPY . .
EXPOSE 8081

# Platform = ios 
# local Stage
FROM base as local-ios
CMD ["npm", "run", "start:local:ios"]

# dev Stage
FROM base as dev-ios
CMD ["npm", "run", "start:dev:ios"]

# preprod Stage
FROM base as preprod-ios
CMD ["npm", "run", "start:preprod:ios"]

# prod Stage
FROM base as prod-ios
CMD ["npm", "run", "start:prod:ios"]

# Platform = android
# local Stage
FROM base as local-android
CMD ["npm", "run", "start:local:android"]

# dev Stage
FROM base as dev-android
CMD ["npm", "run", "start:dev:android"]

# preprod Stage
FROM base as preprod-android
CMD ["npm", "run", "start:preprod:android"]

# prod Stage
FROM base as prod-android
CMD ["npm", "run", "start:prod:android"]

# Platform = web
# local Stage
FROM base as local-web
CMD ["npm", "run", "start:local:web"]

# dev Stage
FROM base as dev-web
CMD ["npm", "run", "start:dev:web"]

# preprod Stage
FROM base as preprod-web
CMD ["npm", "run", "start:preprod:web"]

# prod Stage
FROM base as prod-web
CMD ["npm", "run", "start:prod:web"]
