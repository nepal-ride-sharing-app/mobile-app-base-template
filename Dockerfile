# Use a node image as the base
FROM node:20 as base

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all other content except node_modules
COPY . .

# Set environment variables
ENV EXPO_NO_INTERACTIVE=true

EXPOSE 8081

# Platform = ios 
# dev Stage
FROM base as developmnet-ios
CMD ["npm", "run", "start:dev:ios"]

# preprod Stage
FROM base as test-ios
CMD ["npm", "run", "start:test:ios"]

# prod Stage
FROM base as production-ios
CMD ["npm", "run", "start:prod:ios"]

# Platform = android
# dev Stage
FROM base as developmnet-android
CMD ["npm", "run", "start:dev:android"]

# preprod Stage
FROM base as test-android
CMD ["npm", "run", "start:test:android"]

# prod Stage
FROM base as production-android
CMD ["npm", "run", "start:prod:android"]

# Platform = web
# dev Stage
FROM base as developmnet-web
CMD ["npm", "run", "start:dev:web"]
