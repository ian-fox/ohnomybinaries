# Oh no, my binaries!

This is a playground to test solutions to the problem posed in this [blog post](https://whatthefox.dev/posts/oh-no-my-binaries/).

Some useful tooling is on the `solution-1` branch.

## Usage

`make build`: Build a local copy of the image. Will also create a new ssh keypair to connect to it.

`make run`: Start a container for the exercise.

`make connect`: Connect to the container through ssh. You will enter as the user `ohno` with password `ohno`.

`make clean`: Remove the local images and containers.

## Requirements

* A container interface, such as `docker` or `podman`
* A ssh client and related tools (`ssh-keygen`)
* Make (or just run the commands from the makefile manually)

