---
title: OSGi Portable Java Contract Definitions
summary: OSGi™ Portable Java Contract Definitions
layout: toc-page
---

## Portable Java Contract Definitions

### Background

One of the promises of OSGi is the ability for a bundle to know that the runtime provides the capabilities it needs. At one level this is based on the code package required, however this is insufficient. Packages evolve over time with new methods, interfaces and classes being added. The provider of a package can express the version of the package so a client can select the minimum version it needs and the maximum it will accept. Making use of [semantic versioning][SemVer] also allows the provider to make breaking API changes without affecting client bundles. This is the promise, however the Java platform itself does not version its packages, and consequently a variety of versioning strategies are already being employed in the industry.

### Approach

Rather than define package versions for each individual package in all Java platform packages, a task that will be neither fun, nor will produce consensus, this document page defines a set of OSGi contracts for various Java specifications. These contracts are then versioned according to the Java specification version. A client bundle can then import the packages required with no version and express a dependency on the OSGi contract that defines the packages and the exact specification version required. A provider of the contract then expresses every version of the contract they support. Consequently, the client bundle is only tied to the specification version and each provider of the contract is free to continue using their chosen versioning strategy. It is worth restating that this contracts approach is only necessary for the Java specifications that do not semantically version their packages. It is neither necessary nor recommended for packages that do follow semantic versioning.

### Java EE Contracts

OSGi contract names are advised to be upper camel case (aka Pascal case) with the first segment or segments corresponding to a namespace to ensure uniqueness. The OSGi Specification Project reserves the first segment “OSGi”. Similarly, this design uses the first segment “Java” to define contracts corresponding to the Java based standards defined by the JCP. The “Javax” prefix is also be reserved, but is not used. What follows is the set of contracts.

A [JSON version](contracts.json) is also available for download.

<table class="contracts">
    <tr>
        <th>Contract</th>
        <th>Version</th>
        <th>Packages</th>
        <th>Comments</th>
    </tr>

{% for contract in site.data.contracts %}
    <tr>
        <td>{{ contract.name }}</td>
        <td>{{ contract.version }}</td>
        <td>
        {% for package in contract.packages %}{{ package }}{% if forloop.last == false %},<br/>{% endif %}{% endfor %}
        </td>
        <td>{{ contract.comments }}</td>
    </tr>
{% endfor %}
</table>

### Examples

___Note:___ _`properties` syntax is used, not `MANIFEST`_

A bundle that provides servlet packages unversioned

```properties
Bundle-SymbolicName: jee.vendor1
Bundle-Version: 3
Export-Package: javax.servlet, javax.servlet.annotation, \
 javax.servlet.descriptor, javax.servlet.http
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:List<Version>="3,2.5"; \
 uses:="javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http"
```

A bundle that provides servlet packages using semantic versions

```properties
Bundle-SymbolicName: jee.vendor2
Bundle-Version: 3
Export-Package: javax.servlet; version=2.6, javax.servlet.annotation; version=2.6, \
 javax.servlet.descriptor; version=2.6, javax.servlet.http; version=2.6,
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:List<Version>="3,2.5"; \
 uses:="javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http"
```

A bundle that provides servlet packages using specification marketing versions

```properties
Bundle-SymbolicName: jee.vendor3
Bundle-Version: 3
Export-Package: javax.servlet; version=3, javax.servlet.annotation; version=3, \
 javax.servlet.descriptor; version=3, javax.servlet.http; version=3,
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:List<Version>="3,2.5"; \
 uses:="javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http"
```

A bundle that provides JavaServlet 2.5, but not 3

```properties
Bundle-SymbolicName: jee.vendor4
Bundle-Version: 2.5
Export-Package: javax.servlet; version=2.5, javax.servlet.http; version=2.5
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:Version=2.5; \
 uses:="javax.servlet, javax.servlet.http"
```

A bundle that uses JavaServlet 2.5

```properties
Bundle-SymbolicName: my.company.wab2
Bundle-Version: 2
Import-Package: javax.servlet, javax.servlet.http
Require-Capability: osgi.contract; filter:="(&(osgi.contract=JavaServlet) \
 (version=2.5))"
```

A bundle that uses JavaServlet 3

```properties
Bundle-SymbolicName: my.company.wab
Bundle-Version: 2
Import-Package: javax.servlet, javax.servlet.http
Require-Capability: osgi.contract; filter:="(&(osgi.contract=JavaServlet) \
 (version=3.0))"
```

### References

[Semantic Versioning Whitepaper][SemVer]

[SemVer]: /whitepaper/semantic-versioning/
