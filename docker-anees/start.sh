#!/bin/bash

# Start Nginx in the background
nginx

# Start the Node.js app using PM2
cd /app
pm2-runtime start app.js

# If you want to keep the container running uncomment the line below
# tail -f /dev/null
