FROM pantsel/konga:latest

# Switch to root to install deps
USER root

# Upgrade sails-postgresql for Postgres 12+
RUN npm uninstall sails-postgresql && \
    npm install sails-postgresql@^3.0.0 --save && \
    npm cache clean --force

# Fix permissions
RUN chown -R node:node /app

# Switch back to node user
USER node

# Do NOT override CMD or ENTRYPOINT
# The original image entrypoint will handle startup
