---
title: OSGi Semantic Versioning - Introduction
summary: OSGi™ Semantic Versioning - Introduction
layout: toc-guide-page
lprev: 010-executive-summary.html 
lnext: 030-background.html
---

## Introduction

Versioning is one of the unique selling points of OSGi; there are no other execution environments that have taken the evolution of the artifacts so seriously. In OSGi, all parts that can evolve over time (packages, bundles, fragments) are versioned. Not only did the OSGi Alliance provide the mechanisms for versioning, since its beginning, the OSGi Alliance has used strong semantic versions for all its specified packages.

However, despite this focus on versioning, the Core specification does not mandate a specific _version policy_. The Core specification only contains a recommendation of how to version the artifacts. At the time this recommendation was put in place, there was insufficient experience with versions in an environment like OSGi. The different members of the OSGi ecosystem needed the freedom to version their artifacts as they wanted and therefore only a recommendation was put in the Core specification.

Over the past 10 years, the OSGi Alliance has used a semantic model for versioning artifacts. The current OSGi build contains around 130 projects that generate around 1300 bundles. In any release, a large number of disparate teams develop Reference Implementations and Compliance Tests that are integrated in this build system. Doing this work for almost ten years with a specification that has undergone significant enhancements has given the OSGi Alliance abundant experience with semantic versioning.

This document describes the lessons learned regarding versioning. Though not mandated by the specifications, it is strongly recommended to follow its guidelines so as to remain compatible with other parties using OSGi.
