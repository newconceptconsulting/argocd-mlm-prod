# Use the official Konga image as base
FROM --platform=$BUILDPLATFORM pantsel/konga:latest

# Switch to root to update dependencies
USER root

# Update sails-postgresql to Postgres 12+ compatible version
RUN npm uninstall sails-postgresql && \
    npm install sails-postgresql@^3.0.0 --save && \
    npm cache clean --force

# Set working directory
WORKDIR /app

# Ensure correct permissions
RUN chown -R node:node /app

# Switch back to non-root user for security
USER node

# Expose the Konga port
EXPOSE 1337

# Start Konga
CMD ["node", "app.js"]
