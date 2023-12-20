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

Once kubectl is installed, go on and install [Minikube](https://minikube.sigs.k8s.io/docs/start/)

# With Minikube installed, you can create a cluster as follows:

```
minikube start

```
The command creates a virtual machine and installs Kubernetes.

When the command completes, you can verify that the cluster is created with:

```
kubectl cluster-info

```

The output will be something like this

```
Kubernetes control plane is running at https://127.0.0.1:59296
CoreDNS is running at https://127.0.0.1:59296/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

```
You have a fully-functioning Kubernetes cluster on your machine now.

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

Next time you want to update these Pods, you only need to update the Deployment's Pod template again.

# Get details of your Deployment:
```
kubectl describe deployments
```