#!/bin/sh
# entrypoint.sh

# Substitute environment variables in the config template file,
# and output the result to a new config file that the Angular app will load.
envsubst < /usr/share/nginx/html/config.template.js > /usr/share/nginx/html/config.js

# Optionally, you can print the config for debugging:
# cat /usr/share/nginx/html/config.js

# Finally, start nginx in the foreground
exec nginx -g "daemon off;"
