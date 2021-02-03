---
title: "Nested records and defensive programming"
tags: elm syntax programming
---


* Awkward to update nested records in Elm
* Elm discourages record update by not allowing that which changes the type of the record
* The lack of syntax for easily updating nested records also discourages their use as a defensive programming technique that enforces that you update **all** of the record, by creating an entirely new one, rather than updating an existing one.
