#!/usr/bin/env bash
# --------------------------------------------------- #
# Sync container content /var/www/html to ./content   #
# --------------------------------------------------- #

# determine target folder
target="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/content"

# retrieve docker mount point
src=`docker inspect --format='{{range $mount := .Mounts}}{{if eq $mount.Destination "/var/www/html"}}{{$mount.Source}}{{end}}{{end}}' "intranet"`

# sync into local directory
rsync -a --delete "$src/" "$target/" --exclude=/plugins --exclude=/themes

# alternatively, we can create symlink; not that this may require root permissions
# ln -sf "$src/" "$target"