# My Dev Environment
I made this repo to save some basic configs I like to use before starting to code. I use a docker container to standardize my development
environment so I can work either with linux or windows. Currently, this is just to run ubuntu with python, pip and node pre-installed.

### Requirements
- You should have [Docker](https://www.docker.com/get-started/) installed to run this project
- Git Bash might help, but Powershell will do just fine

### Docker image
```sh
docker image build --file Dockerfile --tag my-dev-env:latest .
```

### Create the container
```sh
docker run -i -t -d --name ubuntu -v $PWD:/root my-dev-env:latest
```

### Check containers
```sh
docker ps -a
```

### Start the container detached
```sh
docker start ubuntu
```

### Attach to the container's terminal
```sh
docker attach ubuntu
```

The bash terminal will be running and ready to use