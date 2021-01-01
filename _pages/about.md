---
title: Pole prediction - An Elm development blog.
---

Pole prediction is a formula 1 prediction website. The front-end is written in [Elm](https://elm-lang.org).
The backend was originally written in Python with an SQL database. I moved this to a serverless backend with
a MongoDb database. The serverless code was written in Javascript.

This year I'm attempting to re-write the backend in Elm. This is challenging and fun for a number of reasons.
One is the design of the datastore which is attempting to use a stream of Elm messages as the data store.
This definitely has some problems, see for example [here](https://materialize.com/kafka-is-not-a-database/).

However the nice thing is that this website is just a small website for my friends and I to record our predictions about formula 1, so there isn't anything mission critical here. This blog attempts to document the journey somewhat. However it is only losely based on poleprediction, it is more a general programming blog, though certainly with an Elm slant to it.
