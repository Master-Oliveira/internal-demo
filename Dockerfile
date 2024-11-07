ARG NODE_VERSION=20.13.0

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV production


WORKDIR /usr/src/app

# Copy the rest of the source files into the image.
COPY . .

RUN npm install 

# Run the application as a non-root user.
USER node

# Expose the port that the application listens on.
EXPOSE 3000

# Run the application.
CMD node src/index.js