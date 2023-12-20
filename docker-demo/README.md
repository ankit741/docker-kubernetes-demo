# Build docker image:
```
docker build --build-arg JAR_FILE=target/*.jar -t spring-docker .
```
# List all docker images :
```
docker images
```
# Run docker image:
```
docker run -p 8080:8080 spring-docker
```
# push docker image to docker hub

login to docker hub:

```
docker login

```
Create docker tag :

```
docker tag spring-docker ankit741/spring-docker:v1
```

Once we have logged in, we can now push our container to Docker Hub.
```
docker push ankit741/spring-docker:v1
```

# Kubernetes — the container orchestrator

Creating a Kubernetes cluster on your local machine with a tool called Minikube. Minikube creates a single-node Kubernetes cluster running on a virtual machine. A Minikube cluster is only intended for testing purposes, not for production.

Before you install Minikube, you have to install  [kubectl](https://kubernetes.io/docs/tasks/tools/).
Kubernetes provides a command line tool for communicating with a Kubernetes cluster's control plane, using the Kubernetes API.

Once kubectl is installed, go on and install [Minikube](https://minikube.sigs.k8s.io/docs/start/)

Minikube is a local Kubernetes setup primarily used for development and testing purposes. It is a lightweight setup that works with tools like Docker, Virtualbox, etc.



# With Minikube installed, you can create a cluster as follows:

```
minikube start
```
Automatically select the docker driver in Windows if installed, there are other drivers as well.

The command creates a virtual machine and installs Kubernetes.


# Check minikube status:
```
minikube status
```

When the command completes, you can verify that the cluster is created with:

```
kubectl cluster-info

```

The output will be something like this

```
Kubernetes control plane is running at https://127.0.0.1:59296
CoreDNS is running at https://127.0.0.1:59296/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

```

# Retrieves Minikube node 

List nodes available in the Kubernetes cluster:

```
kubectl get nodes
```
Note: Minikube creates a single node.

# Retrieves the IP address of the specified node
Retrieves the IP address of the specified node.
```
minikube ip

```
SSH

```minikube ssh -v 7```

```minikube ssh docker@{IP Address}```

# Access Minikube Kubernetes Dashboard
The following command will open the Kubernetes dashboard directly in the browser.
```
minikube dashboard
```

If you just want the dashboard URL, execute the following command. It will start the proxy and displays the Kubernetes dashboard URL in the output.

```
minikube dashboard --url
```

You have a fully functioning Kubernetes cluster on your machine now.

# Create a file named deployment.yaml in your application directory

The first Kubernetes resource is a Deployment. A Deployment creates and runs containers and keeps them alive.

The kubectl explain command can print the specification of every Kubernetes resource directly in your terminal:

```
kubectl explain deployment

```

You don't usually talk about containers in Kubernetes.

Instead, you talk about Pods.

# What is a Pod?

A Pod is a wrapper around one or more containers.

Most often, a Pod contains only a single container — however, for advanced use cases, a Pod may contain multiple containers.

If a Pod contains multiple containers, they are treated by Kubernetes as a unit — for example, they are started and stopped together and executed on the same node.

A Pod is the smallest unit of deployment in Kubernetes — you never work with containers directly, but with Pods that wrap containers.

Technically, a Pod is a Kubernetes resource, like a Deployment or Service.

# Defining a Service

A Service resource makes Pods accessible to other Pods or users outside the cluster.

Without a Service, a Pod cannot be accessed at all.

A Service forwards requests to a set of Pods


# Deploying the application

So far, you created a few YAML files with resource definitions. You are going to submit your resource definitions to Kubernetes.
And Kubernetes will bring your application to life. First of all, make sure that you have a deployment.yaml created. Also, make sure that your Minikube cluster is running:

```
minikube status
```

# Submit resource definitions to Kubernetes with the following command:

```
kubectl apply -f deployment.yaml

```
As soon as Kubernetes receives your resources, it creates the Pods.


# Check your Pods coming alive with:

```
kubectl get pods --watch
```
Running get pods should now show only the new Pods:

```
kubectl get pods
```

```
kubectl get pods -o wide
```
Note: internal IP can't be accessed by the outside world directly. internal ip assigned 

# Interact with running docker container:

The exec command is used to interact with already running containers on the Docker host.
Use docker ps to get the name of the existing container
Use the command docker exec -it <container name> /bin/bash to get a bash shell in the container

```
docker exec -it {id} sh
```

Next time you want to update these Pods, you only need to update the Deployment's Pod template again.

# Get the details of a pod:
```
kubectl describe pod {pod-name}
```

Note: Without a Service, a Pod cannot be accessed at all.

# Get details of your Deployment:

```
kubectl describe deployments
```

# Get all namespaces available:
```
kubectl get namespaces
```
In Kubernetes, namespaces provide a mechanism for isolating groups of resources within a single cluster. Names of resources need to be unique within a namespace, but not across namespaces

```
kubectl get pods --namespace=kube-system
```

# Deleting a pod:
```
kubectl delete pod {name}
```

# Stopping a Cluster

This command shuts down the minikube virtual machine, but preserves all cluster state and data. Starting the cluster again will restore it to it’s previous state
```
minikube stop
```

# Deleting a Cluster

This command shuts down and deletes the minikube virtual machine. No data or state is preserved
```
minikube delete
```
