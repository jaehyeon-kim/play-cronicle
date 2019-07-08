FROM python:3.6

ARG CRONICLE_VERSION=v0.8.28
ENV CRONICLE_VERSION=${CRONICLE_VERSION}

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

# Cronicle
RUN curl -s "https://raw.githubusercontent.com/jhuckaby/Cronicle/${CRONICLE_VERSION}/bin/install.js" | node \
    && cd /opt/cronicle \
    && npm install aws-sdk

EXPOSE 3012
EXPOSE 3014

ENTRYPOINT ["/docker-entrypoint.sh"]
