+++
date = "2017-03-08T07:13:09Z"
title = "RPC"
draft = false
+++



# Communication

Communication is a core concept in distributed systems. It's simultaneously the source of the power and allure and the reason for most of the problems.

Having good primitives for communication is essential to all distributed algorithms.

There are multiple strategies for information exchange between nodes in a system, and they all sit at different layers of abstraction.

- direct one-to-one communication through TCP or datagrams, or, on a higher level of abstraction, HTTP REST APIs, RPC, etc.
- message-oriented communication, where nodes communicate by sending a message to an underlying middleware which takes care of forwarding them to their recipient.
- epidemic protocols where information spreads to random nodes at each step.

## Types of Network Problems
Networks inside the data center can be considered homogeneous, but outside the data center, they are definitely not.

This means some paths are faster, more reliable than others and they certainly are out of our control.

Since the client applications are part of the system we build and are usually outside of the data center, these issues have to be dealt with.

IP-based networks are also fully asynchronous, there is no way to control message latency or enforce ordering of messages.

Asynchronicity implies that messages can be duplicated, delayed, dropped or even reordered.

Of course, in practice, this happens very rarely, but it does occur which means this behavior has to be taken into account.

One example is that reading your writes from a remote server is not guaranteed by the network so you have to add extra mechanisms to all your transactions to ensure that. (ie. TCP)

All these networking issues lead to the following problem: from the perspective of any node, if any another node is not responding to message, three things can happen and there is no way to distinguish between them:

- the other node is down
- the connection is broken
- the connection is very slow

When designing distributed systems, where nodes do work in a coordinated fashion, the above problem is very serious and has to be taken into account in the design process.

## How RPC Works

RPC stands for `remote procedure call`. It is an application layer protocol that, while it doesn't solve the problems discussed earlier, aims to abstract away the network transport and to be as efficient as possible.

It is operation oriented, which means each node exposes a set of method or actions; clients connect to the node, pick an operation, supply the required params and wait for the response.

A different approach is resource orientation, where nodes expose an unbounded set of resources, but the available operations they allow on those resources is limited. One example of this is REST-ful APIs!

RPC protocols are usually coupled with an interface definition language (or IDL). This is a language-agnostic DSL used to define data types and operations supported by nodes.
In return code generation tools transform the IDL files into a language-specific code for both the client and the server of the RPC. It is a toolkit for defining application level protocols.
This way all the network intricacies, the underlying transport, the message serialization and deserialization, request retries, etc. are all abstracted away.

There are several types or RPC in use:

- synchronous RPC, where the client waits for the reply from the server before proceeding.
- asynchronous RPC, where the server will return an empty reply to the client immediately then continue processing the request. This implies that the client is not interested in the response or that it has other means of obtaining it.
- multicast RPC, here the client makes requests to multiple servers aggregating the responses.
- streaming RPC, the client reuses the same connection to send multiple requests in parallel or serial to the same server. The client will process responses as they arrive.

## gRPC Challenge

[gRPC](http://www.grpc.io/) is an RPC protocol which uses [Protocol Buffers](https://developers.google.com/protocol-buffers/) as an IDL and HTTP/2 as a transport.
It offers bi-directional streaming RPC, which means each peer can act as both server and client and requests are processed on the same underlying HTTP/2 connection.

The challenge for this article is to write an echo-server implementation using gRPC.
There are two types of messages that need to be defined:

- a `Ping` message is used for requests and MUST contain a string message.
- a `Pong` message is used in the server replies and MUST contain a string message (the same as the one received in the ping) and a Unix timestamp (time at which the server received the ping)

The server MUST expose these two operations:

- a `Send` operation where the client sends a `Ping` message and the server replies with a `Pong` message that contains the same data as the request plus a timestamp.
- a `Subscribe` operation, the server will expect a `Ping` message and send back `Pong` messages once every second until the client terminates the connection.

Implement a CLI client for this server to facilitate sending messages to the client.

```bash
$ ./client --message=send --content="Hello There!" --server="0.0.0.0:3000"
$ Received `Hello There` at `1490336340`

$ ./client --message=subscribe --content="Hello Again!" --server="0.0.0.0:3000"
$ Replying `Hello There` at `1490336340`
$ Replying `Hello There` at `1490336341`
$ Replying `Hello There` at `1490336342`
$ Replying `Hello There` at `1490336343`
```
For a reference implementation in golang, check out the [github.com/learnscalability/gprc-echo-service](https://github.com/learnscalability/grpc-echo-service) repo.
However, try to build your own implementation and only use the one offered here as a guide.

## Conclusion

Why choose RPC when you can use REST APIs for you distributed systems?
Both technologies live at a different layer of abstraction. [JSON-RPC](http://json-rpc.org/) is an RPC protocol where the transport is HTTP, the encoding is JSON and it works very much like other REST APIs.
Sitting on a higher level of abstraction, RPC offers more benefits and has more opportunity for optimization, but both solutions are valid.

A word of caution about treating RPCs the same way as calls to local objects!
As described in detail in this [paper](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.41.7628) this should be avoided.
RPCs have dramatically different performance characteristics and failure modes. While they formally look very simple, there is a lot of complexity hidden behind the intuitive API.









