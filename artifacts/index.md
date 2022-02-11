---
title: OSGi API Artifacts
summary: OSGi™ API Artifacts
layout: toc-page
---

![Image of OSGi Logo](/img/OSGi_WG.png)

## Overview

All OSGi API artifacts are available on Maven Central with groupId [`org.osgi`](https://search.maven.org/search?q=g:org.osgi).

## Individual Artifacts

There are artifacts available for each chapter in the specification which has an API. The artifactId is the primary package name used in the specification. The major and minor version of the artifact is equal to the version of the specification chapter.

## Aggregate Artifacts

In addition to individual artifacts, some aggregate artifacts are provided which encapsulate multiple related specifications. They have artifactIds starting with `osgi.`.

There are dedicated build time artifacts which are not intended for use at runtime. These should be used with maven scope `provided`. For example, [`osgi.core`](https://search.maven.org/search?q=g:org.osgi%20and%20a:osgi.core).

The[`osgi.annotation`](https://search.maven.org/search?q=g:org.osgi%20and%20a:osgi.annotation) artifact version `8.1.0`, or later, can be used to avoid tool warnings for downstream users of API annotated by the OSGi annotations. Version `8.1.0` was updated to avoid the use of enum types in annotation element values. Version `8.1.0` is generally source compatible with earlier versions and existing Bnd tooling is compatible with the change.

Other than the dedicated build time artifacts, it is generally recommended to use the individual artifacts, as this allows for more precise versioning. In particular, avoid using the `osgi.cmpn` artifact. After Release 7, the `osgi.cmpn` artifact is no longer published to Maven Central to encourage the use of the individual artifacts.
