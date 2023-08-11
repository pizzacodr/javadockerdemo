# The Presentation is Divided in Four Parts
- Containerization Benefits
- Maven Build Tool - Convention over Configuration
- Docker
    - Build Stage (Docker Image)
    - Ship Stage (Docker Registry)
    - Run Stage (Docker Container)
- Code Walkthrough


# Containerization Benefits
Containerization is a operating system-level virtualization or an application-level virtualization over multiple network resources so that software applications can run in isolated user spaces called containers in any cloud or non-cloud environment, regardless of type or vendor.

- Scalability
    - Many containers can be placed in a single host
        Problems with multithreaded

- Flexible resource sharing

    - Extreme utlization of Server Hardware
        https://www.ibm.com/downloads/cas/POANK8YE

        - 75% cost savings due to running more containers then virtual machines
        - (4 times more containers)
        - Twice the throughput
- Running your service on hardware that is much cheaper than standard servers
    - No verdor lock-in

- Fast deployment 
    - ease of creating new instances
    - faster migrations

- Ease of moving and maintaining your applications
- Better security
    - less access needed to work with the code running inside containers and fewer software dependencies


# Maven Build Tool - Convention Over Configuration
- Maven, a Yiddish word meaning accumulator of knowledge
- Opinionated approach to project layout
- Manages Dependencies
- Run Tests
    - In College:
        - General Debugging
        - User Acceptance Testing
    - With Maven I Learned about:
    	- Unit Testing
    	- Integration Testing
- Compiles code
- Generates the archive
    - Jar
    - War
    - Apk
- Generates reports
- Manages Deployment
- Provides an easy way to setup a standard project
- Limited extension through plug-ins
- Uses one XML file for the settings (pom.xml)
    -Stands for Project Object Model
- Provides an easy way to reproduce builds


# What is Docker
Docker is a set of products that use OS-level virtualization to deliver software in packages called containers.

# Docker Image (Build)
- Create image with Docker Build command from Dockerfile
- Universal App Package
- Stanzas create layers
- Image is immutable
- Kernel sharing

    Containerization leverages the kernel within the host operating system to run multiple root file systems. We call these root file systems “containers.” Each container shares the kernel within the host OS, allowing you to run multiple Docker containers on the same host. Unlike VMs, containers do not have an OS within it. They simply share the underlying kernel with the other containers.


# Docker Registry (Ship)
- Used for distribution
- Has become a standard in the Industry, as set by the Open Container Initiative.
- The image has an unique SHA hash that is used for identification
- You place the image in the registry with the Docker Push command
- You get the image out of the registry with the Docker Pull Command
    - Also with the FROM stanza on the Dockerfile
- The same image can run on any system regardless of the Host's OS


# Docker Container (Run)
- Run on top a Container Engine
    - For Kubernetes we have:
        - containerd
        - CRI-O
        - Docker Engine
        - Mirantis Container Runtime
- The Image is run with the Docker Run Command
- Each container is run on it's own namespace
    - Even if you run the same image multiple times, because it gets it's own unique namespace
- Data inside of a container will not persist once the container no longer exists
- You can persist by using
    - Volumes
    - Databases
    - Message Queues
- The container gets it's own virtual IP address managed by the Engine
- The container is it's own system


# Show the code
## Maven
Generating a standard project
- mvn archetype:generate -DgroupId=com.github.pizzacodr.javadockerdemo -DartifactId=javadockerdemo -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

- tree
- mvn dependency:tree
- mvn package
- java -jar target/javadockerdemo.jar

## Docker
- show Dockerfile
- docker build -t javadockerdemo.jar .
- docker image ls
- docker run -p 8080:8080 javadockerdemo.jar

## Maven to Build and Run the Container
- mvn package docker:build docker:run 


# Sources:
- https://www.educative.io/answers/how-do-you-dockerize-a-maven-project
- https://github.com/fabric8io/docker-maven-plugin/tree/master/samples/dockerfile
- https://hub.docker.com/_/eclipse-temurin
- https://dzone.com/articles/build-docker-image-from-maven
- https://www.simplilearn.com/tutorials/docker-tutorial/what-is-docker-container#:~:text=Running%20your%20service%20on%20hardware,containers%2C%20and%20fewer%20software%20dependencies
- https://www.infoworld.com/article/3310941/why-you-should-use-docker-and-containers.html
- https://www.knowledgehut.com/blog/devops/why-use-docker
- https://docs.aws.amazon.com/whitepapers/latest/docker-on-aws/container-benefits.html
- https://www.docker.com/blog/the-10-most-common-questions-it-admins-ask-about-docker/#:~:text=We%20call%20these%20root%20file,kernel%20with%20the%20other%20containers
- https://www.ibm.com/downloads/cas/POANK8YE
