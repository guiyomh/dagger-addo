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

**DevOps Coach,
AWS Solution Architect,
Kubernetes evangelist**

</div>

<div class="col">

![drop-shadow:0,4px,10px,rgba(0,0,0,.4) width:150px](./assets/guillaume-camus.png)

## [Guillaume CAMUS](https://www.linkedin.com/in/guillaumecamus/?locale=en_US)

**Developer and Quality Engineer**

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

# How does it work

![bg left 70%](assets/dagger.drawio.png)

- *Plan*: Contain actions
- *Actions*: Define jobs to execute
- *Clients*: Interact with the underlying operating system
- *Secrets*: Store sensitive data

---

# About CUE

<!--
- Created by google
- Originally designed to configure Borg, the K8s predecessor
-->
- Open-source data validation language and inference engine
- Data validation
- Data templating
- Configuration
- Querying
- Code generation
- Even scripting

---

![bg right](assets/hands-on.jpg)

# Hands-on time

---

# Idea

- Typed input because of CUE language

---

# <!-- fit --> All start with a **Plan**

![bg 60%](assets/loves-plan-together.jpeg)

![bg 60%](assets/plan-dagger.png)

---

# Backup slides

---

<style>

</style>

<!-- _class: white -->

# Workflow automation is a real pain

![bg](assets/developer_pain_point.jpeg)

- you have to build, test, lint, <br /> sign, deploy ...
- *CI environment* is not **not synchronized** <br /> with your *dev environment*
  <!--

  - the development environment is different from one developer to another, and is rarely consistent with that of the CI
  -->
- you have to **maintain scripts**
  <!--

  - these scripts are rarely tested
  -->
- Easy to make **configuration mistakes**
  <!--

  - there is no schema to validate the configuration. You can have a valid YAML file, but it is not understood by the CI. For example, define an environment variable with a boolean type.
  -->
- there is always a new workflow, <br />a good practice
  <!--

  - there is always a new workflow, good practices to execute. This has the consequence that developers spend too much time on it instead of developing.
  So what do we do? We write scripts to automate all these workflows and tasks we have to perform.
  -->
  <!--
  Homemade scripts that do the job but then they don't really evolve and as the team grows, the project grows, the script grows and the technical debt grows and begins to introduce problems  that you can't test. You don't understand how it works and the person who wrote them three years ago is gone.
  -->

> **All this combined consumes a lot of time**

<!-- _class: white -->

---

<!-- _class: white -->
# A pipeline library to do what?

![bg](assets/question.jpeg)

- **share** and **reuse** <br />the work of other teams
  <!--

  - have a modular and composable API
  -->
- run in a **unified way** in any <br />language (java, golang, nodejs,...)
- unit testing of tasks / jobs
