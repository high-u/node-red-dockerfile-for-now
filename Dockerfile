FROM    node:8.9.4-slim

# Install app dependencies
COPY package.json /src/package.json
RUN cd /src; npm install --production

# Bundle app source
COPY setup.js /src/setup.js
COPY settings.js /src/settings.js

ENV NODE_RED_USERNAME=$NODE_RED_USERNAME \
    NODE_RED_PASSWORD=$NODE_RED_PASSWORD

EXPOSE  3000
CMD cd /src; npm start