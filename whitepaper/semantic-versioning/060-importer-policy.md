---
title: OSGi Semantic Versioning - Importer Policy
summary: OSGi™ Semantic Versioning - Importer Policy
layout: toc-guide-page
lprev: 050-exporter-policy.html
lnext: 070-bundles-and-fragments.html
---

## Importer Policy

Having semantic versions offers the possibility to standardize the usage of versions. Import versions can be derived from their build time dependency. For example, if bundle B provides the implementation of an API then it should depend upon a version range that limits changes to the micro and qualifier only. Such a rule is a called a _version policy_.

For stability reasons, an importer should be bound to the lowest possible version it can correctly compile against. It is a common misconception that code should be updated when newer versions of libraries it depends on become available. Not only would this increase the chores of maintaining versions, it easily causes a continuous update cycle in deployment. Any change should change the version of the corresponding package, which requires an update of all the dependencies, which could trigger more changes. Systems designed that way become very brittle very quickly.

An organization must decide upon a version policy regarding whether to depend upon bug fixes or not. Using import version ranges that include the micro part of the version against which the code is being compiled has the advantage that the deployment is forced to upgrade to the bug fix. However, this easily increases the volatility of the deployment. Not including the bug fix in the version range means that the code will not disrupt the deployment but can run against code that was not properly tested and may have a bug. This tradeoff decision must be made by the importer. In the OSGi Alliance build, the micro part is removed from import version ranges, assuming that the deployer is in charge of maintaining a system with the latest updated artifacts but not forcing this upgrade when a third artifact just happened to have been compiled against the fixed component.

Providers implementing an API package must import with a version range that specifies the floor of the version used for compilation and the ceiling of the next minor part. For example, when compiled against version `2.1.4`, the import version range for a provider is `[2.1,2.2)` (assuming bug fixes are ignored).

Consumers of an API package should import with the same floor but can increase the ceiling to the next major version. For example, when compiled against version `2.1.4`, the import version range for a consumer is `[2.1,3)` (again, assuming bug fixes are ignored).

There exist tools that can calculate the import ranges based on the export version and a consumer and provider importer policy.
