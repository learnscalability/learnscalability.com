---
title: Conflict-free Replicated Data Type
date: 2016-03-01 22:19:05
tags:
---

### Intro
State-based CRDTs are called convergent replicated data types, or `CvRDTs`.
They have to send their entire local state to other replicate as an update, which allows
the other replicas to update their local state accordingly and detect operations that
have been received multiple times.

### Definition of Eventual Consistency
- Eventual Delivery: an update executed at a correct replica eventually executes at all correct replicas
- Termination: All update executions terminate at some point.
- Convergence: Correct replicas that have executed the same updates eventually reach equalivalent state (and stay).

### Operations
- __query__ - read replica state. Should have no side-effects on the replica.
- __update__ - write an operation to the replica set.
- __merge__ - merge local and remote replica state.
Must be associative, eg. a+(b+c) = (a+b)+c, commutativity, eg. a+b = b+a, and idempotent, eg. a+a+a+a=a

### Types
1. State Based
- periodical synchronization is performed by transmitting the entire state from one replica to the other and executing a merge operation on the receiving end.
2. Operation Based
- synchronization is done by transmitting only the operation from one replica to the other.

### Alternatives
- Operational Transformation: https://en.wikipedia.org/wiki/Operational_transformation
- Differential Synchronization: https://neil.fraser.name/writing/sync/

### Sources:
- https://en.wikipedia.org/wiki/Conflict-free_replicated_data_type
- http://book.mixu.net/distsys/eventual.html#crdts-convergent-replicated-data-types
- https://github.com/soundcloud/roshi#theory-and-system-properties
- https://hal.inria.fr/file/index/docid/555588/filename/techreport.pdf - survey paper of all CRDTs
- http://christophermeiklejohn.com/crdt/2014/07/22/readings-in-crdts.html
- http://research.microsoft.com/apps/video/default.aspx?id=153540&r=1 - video describing CRDTs.
