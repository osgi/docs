---
title: OSGi Semantic Versioning - Exporter Policy
summary: OSGi™ Semantic Versioning - Exporter Policy
layout: toc-guide-page
lprev: 040-semantic-versions.html
lnext: 060-importer-policy.html
---

## Exporter Policy

Exporters must carefully version any exported package. It is the experience of the OSGi Alliance that virtually any change in an API package is not backward compatible for providers implementing that API. This usually means that any change causes an increment of the minor version part. In the history of the OSGi Alliance, there have been no changes in the major versions of its specifications. The `org.osgi.service.eventadmin` package is currently at version 1.5.1, indicating it underwent 5 modifications that required changes in the framework providers (for example, Knopflerfish, Felix, Equinox) but so far no modifications that required changes in consumers of the framework API.

The Java Language Specification defines binary compatibility in chapter 13[^3].  Any semantic changes must be judged by humans. Tools will be able to detect syntactic violations of the semantic versioning by comparing a previous version and the new version. However, such tools will not be able to detect semantic changes in the code.

Exporters of implementation code should treat the versioning of this code as API packages merged with its provider. There is therefore no concern for providers, only consumers have to be considered. In practice, this means that such a package will only undergo major changes.

An interesting problem for exporters is the policy applied to interfaces that are implemented by the consumers of the API. For example, in the OSGi framework, the Bundle Activator interface is not implemented by a framework provider but by consumers of the framework API: bundles. A change in such an interface will not be backward compatible with any consumers of the API and therefore requires a change in the major part of the version. API designers must therefore be acutely aware of the usage pattern of their interfaces and try to prevent making changes to interfaces that are implemented by the consumers of the API. Any change in an interface that is implemented by a consumer of the API breaks backward compatibility for all consumers. This policy has been strictly followed in the OSGi specifications. Virtually all consumer implemented interfaces are kept very simple and, to date, have not been changed.

### Importing the Packages You Export

OSGi has always strongly promoted importing the packages you export. The resulting substitutability can be used by a framework to minimize the number of different class spaces. There are, however, a number of caveats around this model. Importing exported packages _only_ works well when the exported packages are not bound to private packages. Once an exported package uses a private package, it is not pure API: the package is coupled to implementation packages. Such exported packages cannot be safely substituted by an import from another bundle. Good API design, such as the service API in OSGi, ensures that API packages are not coupled to implementation packages. However, many libraries have packages that are not that cleanly separated. Bundles containing these libraries should not import their exported packages.

When exported packages are imported, care must be taken to specify the import version in the proper way. If an exported package includes the implementation of the API in the package, then the import of the package must use a version range that represents the compatibility requirements for providers of an API implementation.

---

[^3]: <https://docs.oracle.com/javase/specs/jls/se8/html/jls-13.html>
