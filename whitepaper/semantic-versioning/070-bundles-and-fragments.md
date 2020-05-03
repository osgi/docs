---
title: OSGi Semantic Versioning - Bundles and Fragments
summary: OSGi™ Semantic Versioning - Bundles and Fragments
layout: toc-guide-page
lprev: 060-importer-policy.html
lnext: 080-conclusion.html
---

## Bundles and Fragments

The previous chapters use package imports and exports as examples. The reason is that the asymmetry between API consumers and providers is very clear with packages, especially with the OSGi service model where exported packages are always API. However, some analogies can be made with bundles and fragments.

Requiring another bundle is similar to a short form of importing all the exported packages of that required bundle. The version of a bundle must therefore semantically aggregate the semantics of all its constituent packages. If any of these packages are incompatible with its providers then the bundle version must increment the minor version. If any of these packages are incompatible with consumers, the bundle version must increment the major version. It is clear, that on average, the version of a bundle will be much more volatile than the versions of its constituent packages, increasing the dependency problems.
