# Use a stable Konga version
FROM pantsel/konga:latest

# Switch to root to ensure permissions if needed
USER root

# Ensure node modules are owned by node user
RUN chown -R node:node /app

# Switch back to non-root for security
USER node

# Default command to start Konga
CMD ["node", "app.js"]