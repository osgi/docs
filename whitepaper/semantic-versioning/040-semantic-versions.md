---
title: OSGi Semantic Versioning - Semantic Versions
summary: OSGi™ Semantic Versioning - Semantic Versions
layout: toc-guide-page
lprev: 030-background.html 
lnext: 050-exporter-policy.html
---

## Semantic Versions

OSGi versions are called semantic because they have _meaning_. Most versioning models are based on a gradually increasing version number where the only thing defined in the syntax was the ordering of version strings. Several package systems on Unix go a small step further by allowing comparisons to be done numerically or lexicographically. As a consequence, these version systems leave backward _incompatibility_ undefined. Any version that is compared higher is assumed to be compatible, thereby making it impossible to ever introduce a breaking change. In reality, not everything can be kept backward compatible. With existing version systems, the only escape is to rename the artifact.

In the real world, not everything is backward compatible, indicating that a later version is actually not a suitable choice. The OSGi Framework has the unique capability that it can actually host different versions of the same package and correctly handle the dependencies. Without semantic versions, the importer and exporter of a package have no way of communicating backward compatibility and incompatibility.

The core mechanisms provided by the OSGi specifications are the _version_ and _version range_[^2]. An exported package that can be used by other bundles has a version. Such an artifact is called an exporter in this document. A bundle that depends on a package uses a version range to limit the possible candidates. Such a bundle is called an importer. For example:

```
Export-Package: com.acme.foo; version=1.2.3.201003030903
Import-Package: com.acme.foo; version=“[1.2,2.0)”
```

A version can consist of maximum 4 parts: major, minor, micro, and qualifier. The syntax is:

```bnf
version ::= <major> [ ‘.’ <minor> [ ‘.’ <micro> [ ‘.’ <qualifier> ]]]
```

Later parts can be ignored, implying 0 for minor and micro and empty string for qualifier. A version range has a syntax based on the interval notation from mathematics:

```bnf
range   ::= ( ‘[’ | ‘(’ ) version ‘,’ version ( ‘)’ | ‘]’ )
```

Square brackets (‘[’ and ‘]’) indicate inclusive and parentheses (‘(’ and ‘)’) indicate exclusive. That is, `[1.2,2.0)` indicates the version range from version `1.2`, including version `1.2`, up to but not including version `2.0`.

For importer version ranges to work, it is necessary that an exporter changes its version in a predictable way. This predictability allows an importer to use a range that matches its expectations of the exporter’s evolution. For example, an importer could then limit the range it accepts, allowing the exporter to change its version in such a way that it is no longer acceptable to previous importers, thereby signaling a breaking change.

An attractive solution to this problem would have been to allow the exporter to have multiple export versions (or an export version range). The exporter is in a much better position to judge backward compatibility than the importer; no prior agreement on how to version an artifact would be necessary with such a solution. If a package evolves, the exporter just lists the versions with which it is backward compatible. For example, when going from version 1 to version 2, the exporter would just list both versions in its export clause if the change was backward compatible.

Unfortunately, this simple and attractive model fails because the goals of all importers are not equal. Bundles that consume an API package have different backward compatibility rules than a provider of that API. Any semantic change in the API package must be handled by a provider to honor the change in the API contract while many of those changes are backward compatible for consumers. It is therefore paramount that API consumers and providers can describe their different import requirements on the exporter in a concise and easy to understand way. In OSGi, this is achieved by placing semantics on the parts of the version. In this way, a version acts as a small Domain Specific Language (DSL) that is used to document the evolution of the exporter. In this model, the exporter encodes its evolution in its version numbers and importers can then predict which version numbers are compatible with their needs and declare an appropriate import range.

The semantics for the version parts are therefore defined as:

1. _major_ — Packages with versions that have different major parts are not compatible both for providers as well as consumers. For example, `1.2` and `2.3` are completely incompatible.
2. _minor_ — API consumers are compatible with exporters that have the same major number and an equal or higher minor version. API providers are compatible with exporters that have the same major and minor version number. For example, `1.2` is backward compatible with `1.1` for consumers but for providers it is incompatible. Consumers should therefore import `[1.2,2)` and providers should import `[1.2,1.3)`.
3. _micro_ — A difference in the micro part does not signal any backward compatibility issues. The micro number is used to fix bugs that do not affect either consumers or providers of the API.
4. _qualifier_ — The qualifier is usually used to indicate a build identity, for example a time stamp. Different qualifiers do not signal any backward compatibility issues.

Assuming an exported version `1.2.3.built`, the following ranges provide the given semantics:

`[1.2,2)` | Consumer importer policy: will not match when exporter goes to version 2 or later.
`[1.2,1.3)` | Provider importer policy: will not match when exporter goes to version 1.3 or later.
`[1.2.3,1.2.4)` | Strict importer policy: only accepts exporter of version 1.2.3.

---

[^2]: See sections [3.2.5](/specification/osgi.core/7.0.0/framework.module.html#i2655136) and [3.2.6](/specification/osgi.core/7.0.0/framework.module.html#i3189032) of the OSGi Core Specification.
