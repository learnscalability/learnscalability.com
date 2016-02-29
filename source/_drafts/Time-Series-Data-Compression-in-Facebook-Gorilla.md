---
title: Time Series Data Compression in Facebook Gorilla
tags: algorithms
---

## Problem Statement

A time-series database stores data of a

The data has strong

They exploit two particularities of the data set:
- the data has an approximate resolution of one minute.
- the values are continuous with spikes happening seldomly.

* The technique chosen to compress the timestamp is a _delta of delta_.
Esentially a delta of deltas means only storing the difference from the mean of the value for that specific interval.
To futher compress the data, Gorilla stores the delta of deltas prefixed by the varialbe length encoding scheme:
  - 0 - for no difference
  - 10 + 7 bits - for differences in [-63, 64]
  - 110 + 9 bits - for differences in [-255, 256]
  - 1110 + 12 bits - for differences in [-2047, 2048]
  - 1111 + 32 bits - delta of deltas can not be larger than 32 bits.

* The technique chosen to compress the values is called _XOR comparisson_.
Values in time-series databases most often than not very close toghether, such that the sign, exponent, and first few bits of the mantissa are identical.
Again, this happens most of the time. The idea is to compress the most often occuring patterns but also allow exact representation for outliers.
In this case, storing only the positions of the different bits in two consecutive values is more efficient than storing the different, which might be a large number but only differ in one bit.


## Conclusion

Gorilla is a case of good engineering: optimizing for the use-case. By carefull
observations of the data set, engineers were able to exploit the format of the data and obtain very good compression and very fast encoding/decoding, based mostly on bit shifting.
