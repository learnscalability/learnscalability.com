---
title: Overview of Serverless Application Frameworks
date: 2016-02-06 23:43:35
tags: serverless
---
This is a growing document on technologies people use to build serverless websites.


## Available Frameworks

- [serverless/serverless](https://github.com/serverless/serverless) Built on nodejs and formarly know as JAWS, this framework appears to be the most mature, stable and feature full of all those surveyed.
- [MitocGroup/deep-framework](https://github.com/MitocGroup/deep-framework) Developed in nodejs, plenty of features, but with much less adoption.
- [mentum/lambdaws](http://mentum.github.io/lambdaws/) Built in nodejs, this framework is not intended for setting up Lambda powered APIs, it doesn’t have integration with API Gateway. Instead it features SQS support and is intended for offline processing.
- [apex/apex](https://github.com/apex/apex). Written in golang, by the famous TJ Holowaychuck, this framework is popular and stable.
- [exratione/lambda-complex](https://github.com/exratione/lambda-complex). A collection of nodejs-based tools for developing for AWS Lambda.
- [tim-b/grunt-aws-lambda](https://github.com/Tim-B/grunt-aws-lambda). Collection of grunt.js tasks for managing lambda functions in AWS

## Alternatives

- [Iron.io Worker](http://www.iron.io/worker/) supports multiple languages, and offers a containerized environment.
- [Tutum.co](http://tutum.co) is a platform for running container on demand, they got aquired by docker.
- [StackHut.com](https://github.com/StackHut) is a github project, provides similar usage to AWS lambda, only you choose the hosting.
- [hook.io](http://hook.io/) lets you hook a gist script to a webhook, is open source and is built by the awsome Marak Squires of Nodejitsu fame.
- [webscript.io](http://www.webscript.io) cloud workers, handling strictly lua functions.

## Relevant Resources

- [serverlesscode.com](http://serverlesscode.com) is a blog that is all about serverless architectures.
- [highscalability.com](http://highscalability.com) has a couple of intereting real-world examples about using AWS Lambda and API Gateway in production:
 - [The Serverless Start-Up - Down With Servers!](http://highscalability.com/blog/2015/12/7/the-serverless-start-up-down-with-servers.html)
 - [Building An Infinitely Scaleable Online Recording Campaign For David Guetta](http://highscalability.com/blog/2016/1/20/building-an-infinitely-scaleable-online-recording-campaign-f.html),
 - [Using AWS Lambda Functions To Create Print Ready Files](http://highscalability.com/blog/2015/12/28/using-aws-lambda-functions-to-create-print-ready-files.html),
