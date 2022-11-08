---
marp: true
size: 16:9
theme: addo2022
_class: lead
paginate: true
transition: drop
---
<!-- _class: main -->

# Accelerate pipeline library creation

<div class="author">Laurent Gil and Guillaume Camus</div>

---

# Who are we?

<div class="container">

<div class="col">

![drop-shadow:0,5px,10px,rgba(0,0,0,.4) width:150px](./assets/laurent-gil.png)

## [Laurent GIL](https://www.linkedin.com/in/laurent-gil/?locale=en_US)

DevOps Coach,
AWS Solution Architect,
Kubernetes evangelist

</div>

<div class="col">

![drop-shadow:0,4px,10px,rgba(0,0,0,.4) width:150px](./assets/guillaume-camus.png)

## [Guillaume CAMUS](https://www.linkedin.com/in/guillaumecamus/?locale=en_US)

<!--
I am Guillaume. I've been working at manomano for 5 years where I had several roles,
Lead Developer, QA, and now QE.
My goal is to reduce the friction and time wasted due to an ecosystem in order to improve the developer.experience.
-->

Developer and Quality Engineer

</div>

</div>

---

<!--
Nowadays, companies are engaged in a production value race. They need to continuously increase the customer value in pushing new ideas to production with a lean approach.

To achieve it, they often adopt the DevOps culture trying to continuously improve value streams to always produce quicker with a better quality.

During this journey, frameworks and tools allowing a better communication between the engineering teams and the operation ones are created.

This is the type of issue we have tried to solve.
-->

# Problem statement

- How to accelerate the value stream of engineering teams
- How to quickly push new ideas to production
- How to adopt an application centric workflow to decrease the cycle time
- How to enable a smooth communication between engineering teams and platform ones

---

<!--

Multiple solutions are commonly adopted such as :
- Internal Developer Platform
- IaaC libraries
- Pipeline libraries

Today, we will introduce a product which will address the pipeline library issue.

Usually pipeline libraries are created by a team of experts with good automation skills, and a strong test culture. In addition to those skills, the team members are also familiar with advance deployment workflow as well as with infrastructure and configuration management. So that they can help the engineering team to become autonomous to publish their application to production.
-->

# Multiple tools / solutions

- Internal Developer Platform
- Infrastructure as code libraries
- 👉 **Pipeline libraries** 👈

---

# Why create a pipeline library

- Decrease developer workload to push code to production
- Mutualize pipeline best practices across the company
  - DevSecOps
  - Compliance
  - Tests
- Break silos
- Improve cycle time

---

# Pipeline library development challenges

- KISS, Keep It Simple & Stupid
- Avoid the one size fits all solution
- Create a portable library (avoid orchestrator lock-in)
- Enable productivity by allowing job local execution

---

# What problems Dagger address

By using a container approach, Dagger solved the following issues :

- 👉 **Create a portable library (avoid orchestrator locking)** 👈
- 👉 **Enable productivity by allowing job local execution** 👈

---
<!-- _class: header -->
![bg center:40% 40%](./assets/dagger_logo_portrait_on_black.svg)

<!--
Why are we presenting Dagger today?

This is a tool that we discovered last April.
And on the paper, it answers some of our problems to create a pipeline library.

I'm not used to being a speaker, but the tool has helped me a lot
and I wanted to give you some feedback on it.
-->

---

# Overview

- First line of code in **December 2020** by **Solomon Hykes**'team (ex-docker)
- **Independent** and **agnostic** of any language
- **Can be used locally**

![bg right height:350px](assets/dagger-arch.png)

<!--
Dagger is a programmable CI/CD engine that runs your pipelines in containers.
Dagger executes your pipelines entirely as standard OCI containers. This has several benefits:

- Instant local testing
- Portability: the same pipeline can run on your local machine, a CI runner, a dedicated server, or any container hosting service.
- Superior caching: every operation is cached by default, and caching works the same everywhere
- Compatibility with the Docker ecosystem: if it runs in a container, you can add it to your pipeline.
-->
---

# <fit> How does it work ?

![bg right h:50%](assets/dagger-how-it-work.excalidraw.png)

<!--
1. You need to install Dagger.
2. Using the SDK library, your program opens a new session on a Dagger engine.
3. Using the SDK library, your program prepares API requests describing the pipelines to be executed and sends them to the engine.
4. When the engine receives an API request, it computes a Directed Acyclic Graph (DAG) of operations and starts processing the operations simultaneously.
5. When all operations in the pipeline have been resolved, the engine returns the pipeline result to your program.
6. Your program can use the pipeline result as input for new pipelines.
-->

---

# Some concept

![bg left 80%](assets/dagger.excalidraw.png)

- **Plan**: is the pipeline manifest.
  - **Actions**: Define jobs to execute
  - **Clients**: Interact with the underlying operating system

<!--
All starts with a plan.
Within this plan we can:

- interact with the client
  - read  /write files on the host
  - read env variables in the host
- declare actions
-->

---

# About CUE

CUE has all the features you wish in YAML or JSON:

- string interpolation
- templating
- static type checking
- data validation
- code generation
- even scripting

<!--
It is a configuration language created by google.
Originally, it was used to configure Borg, the predecessor of the K8.
Cue is a mix between YAML and JSON with additional features.

Currently, we used to validate configuration files.

Here you have an example of what can be done with cue.
We describe a Person structure. This structure is composed of an age and a list of hobbies.

Then we describe another structure Adult which inherits from Person, but which adds a constraint on the age.

And finally we implement the Adult structure with John. Of course, if we put an age lower than 21, Cue would have raised an error.

Dagger uses this language to describe the pipeline. This is very useful, because if we make an error we are immediately alerted, because the plan does not compile.
-->

![bg right 60%](assets/cue-example.png)

---
<!-- _class: header -->

![bg right:50% w:100%](assets/hands-on.jpg)

# Hands-on time

<!--
Now it's time to practice.
-->

---

# Use case

![bg right fit](assets/pipeline.png)

A simple pipeline to build the presentation slides.

3 steps:

- 👉 **lint** 👈
- 👉 **build** 👈
- deploy

Github: <https://github.com/guiyomh/dagger-addo>
Slides: <https://guiyomh.github.io/dagger-addo>

<!--
Let's take a simple use case.
We made this presentation in markdown.
The slides are versioned in Github, built with Github Action and hosted on Github Pages.

We have a simple pipeline. In 3 steps:
- we have a linter to make sure the markdown is correct.
- then we have a build task for the slides.
- then we publish the slides on Github pages
-->

---

# <!--left--> All start<br />with a Plan

![50% fit](assets/loves-plan-together.jpeg)
![bg right fit](assets/dagger-plan.png)

<!--
As we explained in the slide of concept.
To describe your pipeline you need a Plan.

With the action property of the plan, we will describe the actions we want to execute.

Don't forget that the actions are executed in containers. So at some moment, If I will want to interact
with my host, to read files, to read environment variables, to write a result into a file, etc...

I need to explain how to access the resources.

This is what the Client property allows us to describe.

**Have you seen this particular syntax starting with hashtags?**

These hashtags are specific to the Cue language. They refer to definitions.
These definitions can be local (i.e. described in the same file, like the example I showed you with john implementing the Adult definition)

But the interest here is to be able to import external definitions. Dagger provides a number of definitions that can be used directly or combined to create new definitions. This is the choice we made to create our library.
-->

---

# Import dependencies

![bg left fit](assets/dagger-import.png)

- Centrally develop common definitions
- Speed up pipeline creation by mutualize / reusing code
- Compose pipeline from reusable actions

<!--
We made this choice because it allows us to centralize the common definitions between our different projects.
This avoids redeveloping the wheel for each project. This is a real time saver to start quickly.
It also allows us to ensure a relative homogeneity between projects.
-->

---

# Markdown definitions

![h:480](assets/dagger-definition-markdown.excalidraw.png)

<!--
Ok, let's start by creating our first definition.

For our action to run we need an image.
So we create an image definition. Which takes as input the name of the image
and the tag of the image.

As we have a private repository at ManoMano, we also add the possibility to define a username and a secret as input.
And finally, we use the definition provided by dagger to pull the image.

Now let's create our definitions for markdown lint.
We need the source of our project, and the list of files to transform into html.

We use the image property, to define the execution environment of our future action.
We have chosen to put it as input parameter in order to override it with a custom image.

And finally, we use the definition `docker.Run` provided by dagger to run a command line in the container.

Okay!

Now that we have our definitions, how can we use them?
-->

---

# Lint in action

![h:480](assets/dagger-lint-action.excalidraw.png)

<!--
We start by importing our cue package.
Then we create a lint action that extends our markdown.#Lint definition (the red box)
And we define our source and file input parameters.
As we don't specify an image, dagger will use the image defined by default in our Lint definitions.
-->

---

# How to use a custom image?

![h:480](assets/dagger-lint-action-ecr.excalidraw.png)

<!--
As we have seen in the definition of the markdown lint.
We have an optional parameter, allowing us to specify the default image.

In this example, I start by defining some variables in the red box.

Then, I want to use an image from a private ECR registry. So I need to authenticate myself.
To do this, I plan an interaction with the host machine.
Here, in the green box, I ask to run a command on the host machine to get a token for ECR.

Then in the orange box, I use my markdown.image. I specify the repository, the tag and my credentials.

Now I can inject my custom image into my lint action. By linking image.markdownlint to the image input of my lint action.

That's it. It's not much more complicated than that.

Ok, I know how to create actions, but where is my pipeline?
-->
---

# Build

![bg right fit](assets/dagger-action-build.excalidraw.png)

- Chain multiple steps
- Export action onto the host file system

<!--
To have a better understanding. Let's take the example of the action build.
It's an action a little more complex, because we build 3 media: html, pdf, powerpoint.

So we have created 3 sub-actions. They all take as input the sources of the project except the HTML action.
The Html action requires to copy the assets in the publication directory.
So we added a sub-action assets to do that.

And then we linked our actions together. Instead of taking the sources of the project as input,
the html action takes the output of the assets action (green box).

And finally, we merge the output of our 3 sub-actions (html, pdf, powerpoint) with the definition core.#Merge.
We get a file system with all the files generated.

But that's not all! We are in a container. So we have to write the build output on our host machine.
-->
---

# Interact with<br/>the host

![bg h:450 left ](assets/client-filesystem.excalidraw.png)

<!--
To do this, we add a client:filesystem instruction to our plan.
We specify the directory or file we want to target.
We also specify with which right we want to access it (read/write).
And we link the output of our build actions to the content.
-->

---
<!-- _class: header -->
# Our experience feedback

<!--
Dagger is a very young project that evolves very quickly.
With Laurent, we discovered it in April of this year and we liked it immediately.

On paper, it promises a nice developer experience. But we had some troubles.
In particular, the learning curve of Cuelang. We took cuelang for configuration format, but it is much more.

So, It took us a while to find a working pattern for what we wanted to do.

But the dagger teams are aware of this problem and announced in October the release of new SDK in NodeJS, Python, Golant.
-->

---
<!-- _class: thank -->

Thank for all
