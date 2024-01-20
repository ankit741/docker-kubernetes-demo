# What is a Docker?
Docker is a platform for developers and sysadmins to build, share, and run applications with containers. The use of containers to deploy applications is called containerization. Containers are not new, but their use for easily deploying applications is.

Containerization is increasingly popular because containers are:

Flexible: Even the most complex applications can be containerized.
Lightweight: Containers leverage and share the host kernel, making them much more efficient in terms of system resources than virtual machines.
Portable: You can build locally, deploy to the cloud, and run anywhere.
Loosely coupled: Containers are highly self-sufficient and encapsulated, allowing you to replace or upgrade one without disrupting others.
Scalable: You can increase and automatically distribute container replicas across a data center.
Secure: Containers apply aggressive constraints and isolations to processes without any configuration required on the part of the user.

# Benefits of using Containers over Virtual Machines

Now let’s discuss what is the benefit of Docker over VMs.

Unlike VMs( Virtual Machines ) that run on a Guest OS, using a hypervisor, Docker containers run directly on a host server (for Linux), using a Docker engine, making it faster and lightweight.

Docker containers can be easily integrated compared to VMs.
With a fully virtualized system, you get more isolation. However, it requires more resources. With Docker, you get less isolation. However, as it requires fewer resources, you can run thousands of containers on a host.
A VM can take a minimum of one minute to start, while a Docker container usually starts in a fraction of a second.

# What is a container?
A container is an isolated environment for your code. This means that a container has no knowledge of your operating system, or your files. It runs on the environment provided to you by Docker Desktop. Containers have everything that your code needs in order to run, down to a base operating system. You can use Docker Desktop to manage and explore your containers.

# Technology Used in Docker

The programming language used in Docker is GO. Docker takes advantage of various features of Linux kernel like namespaces and cgroups.

namespaces: Docker uses namespaces to provide isolated workspace called containers. When a container is run, docker creates a set of namespaces for it, providing a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace.

cgroups( control groups ): croups are used to limit and isolate the resource usage( CPU, memory, Disk I/O, network etc ) of a collection of processes. cgroups allow Docker engine to share the available hardware resources to containers and optionally enforce limit and constraints.

UnionFS( Union file systems ): are file systems that operate by creating layers, making them very lightweight and fast.It is used by Docker engine to provide the building blocks for containers.

Docker Engine combines the namespaces, cgroups, and UnionFS into a wrapper called a container format. The default container format is libcontainer.


# Installation

# Linux
Run this quick and easy install script provided by Docker:

curl -sSL https://get.docker.com/ | sh
If you're not willing to run a random shell script, please see the installation instructions for your distribution.

# Windows 10
Hyper-V must be enabled in BIOS

VT-D must also be enabled if available (Intel Processors).

# Windows
Instructions to install Docker Desktop for Windows can be found here

Once installed, open Powershell as administrator and run:

# Display the version of docker installed:
docker version


# Docker container commands

```
    docker ps           
    
    #Lists containers (active or not)
    docker ps -a        
    
     #Removes a container
    docker rm [container ID or shortname]          
    
    #Removes a running container
    docker rm --force [container ID or shortname]           
    
    #Stops a running container
    docker stop  [container ID or shortname]
    
    #Starts a container
    docker start   [container ID or shortname]
```

# Docker image commands
 ```
    docker image

    #To build an image and check containers run
    docker build --tag [shortname] .
```

# Run a Docker container
Use to start a container based on an image

 ```
 Docker run --publish 8000:8080 --detach --name [shortname] [appname]     
Flags:
--publish 8000:8080 asks Docker to forward traffic incoming on the host’s port 8000 to the container’s port 8080.

--detach Docker runs the container in the background

-t, --tty  For apps that aren't running a background process, this flag allocates a pseudo-TTY
```
