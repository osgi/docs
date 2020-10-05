---
title: OSGi API Artifacts
summary: OSGi™ API Artifacts
layout: full-width-page
---

![Image of OSGi Logo](/img/osgi-logo-512.png)

# Overview

All artifacts from OSGi are available on Maven Central with group id [`org.osgi`](https://search.maven.org/search?q=g:org.osgi).

# Individual Artifacts

There are artifacts available for each chapter in the specification, where the the primary package name is used as the artifact id (starting with `org.osgi.`). The version is always equal to the version of the specification chapter.
In addition there may be dedicated build time artifacts provided (e.g. for annotations), so one chapter might have more than one artifact.

# Aggregate Artifacts

In addition to individual artifacts some aggregate artifacts are provided which encapsulate multiple specification chapters. They have an artifact id starting with `osgi.`. It is recommended to use the individual artifacts though, as this allows a more granular versioning.