# Oh no, my binaries!

This is a playground to test solutions to the problem posed in an upcoming blog post.

## Usage

`make build`: Build a local copy of the image. Will also create a new ssh keypair to connect to it.

`make run`: Start a container for the exercise.

`make connect`: Connect to the container through ssh. You will enter as the user `ohno` with password `ohno`.

`make clean_containers`: Remove exited containers. I kept them by default in case you want to investigate what went wrong after a failed attempt.

`make clean`: Remove the local image and all containers.

## Requirements

* A container interface, such as `docker` or `podman`
* A ssh client and related tools (`ssh-keygen`)
* Make (or just run the commands from the makefile manually)

