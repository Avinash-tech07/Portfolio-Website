#!/bin/sh
set -e

PORT="${PORT:-80}"

printf 'Listen %s\n' "$PORT" > /etc/apache2/ports.conf
sed -i "s/\${PORT}/${PORT}/g" /etc/apache2/sites-available/000-default.conf

exec apache2-foreground
