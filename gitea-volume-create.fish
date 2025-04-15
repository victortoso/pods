#!/usr/bin/env fish

if ! podman volume create gitea;
    exit 10
end

# Folders to create
set target config data postgress

# Mountpoint
set datadir (podman volume inspect gitea --format '{{ (index .Mountpoint) }}')

cd $datadir
podman unshare mkdir $target
podman unshare chown 1000:1000 $target
cd -
