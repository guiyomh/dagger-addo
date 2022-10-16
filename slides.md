---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
transition: drop
---

<style>
.container { display: flex; }
.col{ flex: 1;}
.col img {display: flex;margin: auto}
.col h2{ text-align: center}
section.white {
  color: white;
  text-shadow: #000 1px 0 10px;
}
</style>


<!-- https://marpit.marp.app/directives -->

# Accelerate pipeline library creation
## with Dagger

![bg left:40% 80%](./assets/dagger_logo_portrait.svg)

---
<!-- _class: white -->
# Who are we?

![bg](assets/who-are.jpeg)

<div class="container">

<div class="col">

![drop-shadow:0,5px,10px,rgba(0,0,0,.4)](./assets/laurent-gil.png)

## Laurent GIL

**AWS Solution Architect,**
Passionate by technology and automation.

</div>

<div class="col">

![drop-shadow:0,4px,10px,rgba(0,0,0,.4)](./assets/guillaume-camus.png)

## Guillaume CAMUS

**Developer and Quality Engineer**
Curious, I like to design things and check if the design is viable and fits the needs.

</div>

</div>

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

---

![bg center:50% 50%](./assets/dagger_logo_portrait.svg)

---
# History

- First line of code in **December 2020** by **Solomon Hykes**'team (ex-docker)
- **Independent** and **agnostic** of any language
- **Can be used locally**

<!--
Dagger is portable and compatible
-->

---
# Bye the complexity

- Goodbye **JSON**, **YAML**, welcome **CUE**

---
# <!-- fit --> All start with a **Plan**

![bg 60%](assets/loves-plan-together.jpeg)

![bg 60%](assets/plan-dagger.png)
