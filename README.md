# CoreWorker
DotNet Preview 3 Worker Service running in Docker Container (Linux)

## Requires
- Docker

## Execution
- Clone the code
- Build the Image using the provided Dockerfile `docker build --rm -f "Dockerfile" -t coreworker:latest .`
- Start a container in Interactive mode to see the worker running `docker run --rm -it coreworker:latest`

**Note this Dockerfile is configured to look at the DotNet Preview images and not the standard DotNet Docker Images, feel free to change the labels!**
