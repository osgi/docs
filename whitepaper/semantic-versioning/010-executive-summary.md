---
title: OSGi Semantic Versioning - Executive Summary
summary: OSGi™ Semantic Versioning - Executive Summary
layout: toc-guide-page
lprev: index.html 
lnext: 020-introduction.html
---

## Executive Summary

The OSGi Alliance recommends the versioning of exported packages. These versions should reflect the evolution of these packages. For this reason, a change in the first (major) part of the version signals backward incompatible changes to the artifacts. That is, going from version 1.5 to version 2 signals that another artifact compiled against 1.5 up to (but not including) version 2 of that initial artifact is _not_ compatible with the new version of the initial artifact.

A package can contain an API. There are two types of clients for these API packages: _API consumers_ and _API implementation providers_. A change in the second (minor) part of the version signals that the change is backward compatible with consumers of the API package but not with the providers of that API. That is, when the API package goes from version 1.5 to 1.6 it is no longer compatible with a provider of that API but consumers of that API are backward compatible with that API package.

The third and fourth part of the version (micro and qualifier) signal bug fixes and build stamp and have no effect on backward compatibility.

Importers of packages know their role (consumer or provider of an API) and can limit the import range of the package. For the previous example, a consumer would import [1.5,2) while a provider would import [1.5,1.6).

API designers must carefully evolve an API package, especially when consumers implement interfaces in this API package. Changes to such interfaces break binary compatibility for consumers and necessitate a major update of the version.
