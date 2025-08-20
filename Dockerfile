# Start from the official Konga image
FROM pantsel/konga:latest

# Switch to root to install deps
USER root

# Update sails-postgresql to a Postgres 12+ compatible version
RUN npm uninstall sails-postgresql && \
    npm install sails-postgresql@^3.0.0 --save && \
    npm cache clean --force

# Switch back to non-root user for security
USER node

# Start Konga
CMD ["node", "--harmony", "app.js"]
