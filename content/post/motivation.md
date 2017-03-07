+++
date = "2017-03-05T08:18:27Z"
title = "Motivation"
draft = false
+++

`learnscalability.com` is a project that presents topics on distributed systems. The focus is on patterns, algorithms and tools that are the building blocks of modern scalable systems.

Along with that, there will be reviews of relevant research papers, analyses of existing open-source systems and solutions to design exercises.

## Motivation

When designing scalable systems, the usual approach is to pick open source components that cover as much as possible of the specification. Then engineers write the code that glues these components together.

The goal, on the one hand, is to minimize the amount of code written in-house because it has the potential of being buggy and insecure. On the other hand, the third-party systems chosen need to be small in focus, well written, efficient, robust and secure in production.

Because of this optimization challenge, picking off-the-shelf components needs to be coupled with a good understanding of how they work at a lower level of abstraction.

The goal of this project is to decompose some of these solutions and distill the core ideas that power them. Armed with this knowledge, engineers are in a better position to decide whether to build or download.

## Approach

There is a lot of excellent theoretical content online. This project is based on that strong foundation.

However, often the practical aspects are hidden in assignments, quizzes and exercises. We aim to cover these aspects in this project; to implement and test systems so we can better understand them.

This project will focus on real-life scenarios. Some theoretical environments that assume machines don't fail or that networks are reliable are out of scope. The current pervasive platform for running distributed systems is public, multi-tenant, non-standardized cloud environments; all content on this site will take this into consideration.

Each topic discussed will cover:
* a technical specification of the problem at hand, as close as possible to a real use-case.
* a runnable implementation written in open-source [high-quality Golang code](http://alexandrutopliceanu.ro/post/quality-go-code/)
* a theoretical motivation of the technical decisions made in the implementation.
* production-quality alternatives and their design decisions.

## Conclusion

While open source communities are excellent at exploring the solution space of a given problem, at producing battle-tested implementations and beautiful documentation, they tend to rush through the theoretical foundations behind the design decisions in their projects.

This project hopes to convince communities of the value of spending the extra effort to cover the core ideas in an accessible way.
