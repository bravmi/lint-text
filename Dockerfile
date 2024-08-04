FROM node:14-alpine

# Install write-good
RUN npm install -g write-good

# Install proselint
RUN apk add --no-cache py3-pip
RUN pip install proselint

# Add entrypoint script
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
