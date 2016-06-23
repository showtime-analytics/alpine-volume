volume-base
=============

A base image to run any storage volume for a service. 

## Build

```
docker build -t showtimeanalytics/volume-base:<version> .
```

## Usage

To start-once the service volume, exec

```
docker run -t \
  -v <volume>:<mount-point> \
  -e "SERVICE_USER=root" -e "SERVICE_UID=0" \
  -e "SERVICE_GROUP=root" -e "SERVICE_GID=0" \
  -e "SERVICE_VOLUMES=<comma_separated_mount-points>" \
  showtimeanalytics/volume-base:<version> .
```

These are the default value for the environment variables:
- SERVICE_USER=${SERVICE_USER:-"root"}        # User owner of the volume
- SERVICE_UID=${SERVICE_UID:-"0"}             # UID owner of the volume
- SERVICE_GROUP=${SERVICE_GROUP:-"root"}      # Group owner of the volume
- SERVICE_GID=${SERVICE_GID:-"0"}             # GID owner of the volume
- SERVICE_VOLUMES=${SERVICE_VOLUMES:-"/opt"}  # Comma separated volumes to own and expose
