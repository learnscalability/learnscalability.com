---
title: HyperLogLog
tags: algorithms
---

## Problem

This algorithm is attempting to solve the problem of `set cardinality`, ie.
determine the number of unique elements in a collection which might have duplicates.
This is usefull in a lot of cases in computer science, here are two of the most
usual applications:

1. in SQL databases, there is a component called a `Query Optimizer`, which has
the job of translating the SQL query received by the server into a minimum cost
query execution plan for that specific database. SQL queries are often complex, can involve
joining multiple relations. Being able to quickly sort tables by size is key in
the query optimizers job of deciding which tables to cache in memory and which to
scan on the disk.

2. in stream processing, one of the basic metrics you can continuously compute
over a continuous stream of elements is the number of unique elements you have
processed in the stream so far.

Note that in both these cases, the exact cardinality of the sets in question is
not required, and estimate with a small error can be used just as well. This is
exactly the use case that HyperLogLog handles.

## Evolution of the Solution

The initial naive solution is to add each element in a hash table. This will
easily detect duplicates, since they will hash to same value. Computing the size
of the hash table gives the cardinality of the set. The problem with this approach
is the need to store all hash values. This can rapidly become unmanageable. Take,
for instance, a 64GB machine and the md5 hash function which produces 128bit hash
values, this will permit the machine to store _only_ around 8.5 billion values.
This is impractical for many workloads and does not exploit the observation that
an _exact_ value is not needed.


