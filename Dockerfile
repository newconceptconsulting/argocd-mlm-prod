FROM pantsel/konga:latest

USER root

# Downgrade sails-postgresql to a compatible version
RUN npm uninstall sails-postgresql && \
    npm install sails-postgresql@0.12.2 --save && \
    npm cache clean --force

USER node
# Keep the original entrypoint and CMD

