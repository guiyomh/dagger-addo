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

Developer and Quality Engineer

</div>

</div>

---

# Problem statement

- How to accelerate the value stream of engineering teams
- How to quickly push new ideas to production
- How to adopt an application centric workflow to decrease the cycle time
- How to enable a smooth communication between engineering teams and platform ones

---

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

---

# History

- First line of code in **December 2020** by **Solomon Hykes**'team (ex-docker)
- **Independent** and **agnostic** of any language
- **Can be used locally**

<!--
Dagger is portable and compatible
-->

---

# Overview

<!-- ![bg left 90%](assets/dagger-arch.png) -->

![height:350px](assets/dagger-arch.png)

---

# How does it work

![bg left 70%](assets/dagger.drawio.png)

- *Plan*: Contain actions
- *Actions*: Define jobs to execute
- *Clients*: Interact with the underlying operating system
- *Secrets*: Store sensitive data

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
- Created by google
- Originally designed to configure Borg, the K8s predecessor
- CUE => Strongly typed
-->

![bg right 60%](assets/cue-example.png)

---

![bg right:50% w:100%](assets/hands-on.jpg)

# Hands-on time

---

# Use case

![bg right:50% w:100%](assets/pipeline.png)

A simple pipeline to build the presentation slides.

3 steps:

- 👉 **lint** 👈
- 👉 **build** 👈
- deploy

---

# All start with a **Plan**

<!-- ![bg left fit](assets/loves-plan-together.jpeg) -->

![bg right fit](assets/dagger-plan.png)

---

# Import dependencies

![bg left fit](assets/dagger-import.png)

- Centrally develop common actions
- Speed up pipeline creation by mutualizing / reusing code
- Compose pipeline from reusable actions

---

# Lint action

---

# Lint usage

![bg left fit](assets/dagger-action-lint.png)

---

# Build

![bg left fit](assets/dagger-action-build.png)

- Chain multiple steps
- Export action onto the host file system