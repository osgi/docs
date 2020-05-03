---
title: OSGi Portable Java Contract Definitions
summary: OSGi™ Portable Java Contract Definitions
layout: toc-page
---

## Portable Java Contract Definitions

### Background

One of the promises of OSGi is the ability for a bundle to know that the runtime provides the capabilities it needs. At one level this is based on the code package required, however this is insufficient. Packages evolve over time with new methods, interfaces and classes being added. The provider of a package can express the version of the package so a client can select the minimum version it needs and the maximum it will accept. Making use of [semantic versioning][SemVer] also allows the provider to make breaking API changes without affecting client bundles. This is the promise, however the Java platform itself does not version its packages, and consequently a variety of versioning strategies are already being employed in the industry.

### Approach

Rather than define package versions for each individual package in all Java platform packages, a task that will be neither fun, nor will produce consensus, this document page defines a set of OSGi contracts for the JSR specifications. These contracts are then versioned according to the JSR version. A client bundle can then import the packages required with no version and express a dependency on the OSGi contract that defines the packages and the exact specification version required. A provider of the contract then expresses every version of the contract they support. Consequently, the client bundle is only tied to the specification version and each provider of the contract is free to continue using their chosen versioning strategy. It is worth restating that this contracts approach is only necessary for the JSR specifications as they do not semantically version their packages. It is neither necessary nor recommended for packages that do follow semantic versioning.

### Java EE Contracts

OSGi contract names are advised to be upper camel case (aka Pascal case) with the first segment or segments corresponding to a namespace to ensure uniqueness. The OSGi alliance reserves the first segment “OSGi”. Similarly this design uses the first segment “Java” to define contracts corresponding to the Java based standards defined by the JCP. The “Javax” prefix is also be reserved, but is not used. What follows is the set of contracts.

A [JSON version](contracts.json) is also available for download.

Contract | Version | JSR | Java SE Level | Java EE Level | Packages | Comments
-|-|-|-|-|-|-
JavaActivation | 1.1 | 925 | 6/7 | | javax.activation |
JavaActivation | 1.1.1 | 925 | 6 (Update 10 or later)/7 | | javax.activation | Compatible with 1.1
JavaAnnotation | 1 | 250 | | | javax.annotation, javax.annotation.security |
JavaAnnotation | 1.1 | 250 | | 6 | javax.annotation, javax.annotation.security, javax.annotation.sql | Compatible with 1
JavaAnnotation | 1.2 | 250 | | 7 | javax.annotation, javax.annotation.security, javax.annotation.sql | Compatible with 1 & 1.1. Subset available in SE 8
JavaBatch | 1 | 352 | | 7 | javax.batch.api, javax.batch.api.chunk, javax.batch.api.chunk.listener, javax.batch.api.listener, javax.batch.api.partition, javax.batch.operations, javax.batch.runtime, javax.batch.runtime.context |
JavaBeanValidation | 1 | 303 | | 6 | javax.validation, javax.validation.bootstrap, javax.validation.constraints, javax.validation.groups, javax.validation.metadata, javax.validation.spi |
JavaBeanValidation | 1.1 | 349 | | 7 | javax.validation, javax.validation.bootstrap, javax.validation.constraints, javax.validation.constraintvalidation, javax.validation.executable, javax.validation.groups, javax.validation.metadata, javax.validation.spi | Compatible with 1
JavaCDI | 1 | 299 | | 6 | javax.decorator, javax.enterprise.context, javax.enterprise.context.spi, javax.enterprise.event, javax.enterprise.inject, javax.enterprise.inject.spi, javax.enterprise.util |
JavaCDI | 1.1 | 346 | | 7 | javax.decorator, javax.enterprise.context, javax.enterprise.context.spi, javax.enterprise.event, javax.enterprise.inject, javax.enterprise.inject.spi, javax.enterprise.util | Compatible with 1
JavaEJB | 2.1 | 153 | | | javax.ejb, javax.ejb.spi |
JavaEJB | 3 | 220 | | | javax.ejb, javax.ejb.spi | Compatible with 2.1
JavaEJB | 3.1 | 318 | | 6 | javax.ejb, javax.ejb.embeddable, javax.ejb.spi | Compatible with 2.1, 3
JavaEJB | 3.2 | 345 | | 7 | javax.ejb, javax.ejb.embeddable, javax.ejb.spi | Compatible with 2.1, 3, 3.1
JavaEJBLite | 3.1 | 318 | | 6 | javax.ejb, javax.ejb.embeddable, javax.ejb.spi | EJBlite is a subset of the EJB specification. The package content is logically subset. A provider of JavaEJB is required to also provide this contract. A provider of JavaEJBLite is not required to provide JavaEJB.
JavaEJBLite | 3.2 | 345 | | 7 | javax.ejb | EJBlite is a subset of the EJB specification. The package content is logically subset. A provider of JavaEJB is required to also provide this contract. A provider of JavaEJBLite is not required to provide JavaEJB. This contract is not backwards compatible with 3.1 because of the removal of javax.ejb.embeddable.
JavaEnterpriseConcurrency | 1 | 236 | | 7 | javax.enterprise.concurrent |
JavaEL | 2.1 | 245 | | | javax.el |
JavaEL | 2.2 | 245 | | 6 | javax.el | Compatible with 2.1
JavaEL | 3 | 341 | | 7 | javax.el | Compatible with 2.2
JavaInject | 1 | 330 | | 7 | javax.inject |
JavaInterceptor | 1.1 | 318 | | 6 | javax.interceptor | Should this be separate from CDI & EJB???
JavaInterceptor | 1.2 | 318 | | 7 | javax.interceptor | Compatible with 1.1 Should this be separate from CDI & EJB???
JavaJACC | 1.1 | 115 | | | javax.security.jacc
JavaJACC | 1.4 | 115 | | 6 | javax.security.jacc | Compatible with 1.1
JavaJACC | 1.5 | 115 | | 7 | javax.security.jacc | Compatible with 1.1 & 1.4
JavaJASPIC | 1 | 196 | | 6 | javax.security.auth.message, javax.security.auth.message.callback, javax.security.auth.message.config, javax.security.auth.message.module |
JavaJASPIC | 1.1 | 196 | | 7 | javax.security.auth.message, javax.security.auth.message.callback, javax.security.auth.message.config, javax.security.auth.message.module | Compatible with 1
JavaJAXB | 2.1 | 222 | 6 (update 4 or later) | | javax.xml.bind, javax.xml.bind.annotation, javax.xml.bind.annotation.adapters, javax.xml.bind.attachment, javax.xml.bind.helpers, javax.xml.bind.util |
JavaJAXB | 2.2 | 222 | 7/8 | 6/7 | javax.xml.bind, javax.xml.bind.annotation, javax.xml.bind.annotation.adapters, javax.xml.bind.attachment, javax.xml.bind.helpers, javax.xml.bind.util | Compatible with 2.1
JavaJAXR | 1 | 93 | | 6/7 | javax.xml.registry, javax.xml.registry.infomodel |
JavaJAXRS | 1.1 | 311 | | 6 | javax.ws.rs, javax.ws.rs.core, javax.ws.rs.ext |
JavaJAXRS | 2 | 339 | | 7 | javax.ws.rs, javax.ws.rs.core, javax.ws.rs.ext, javax.ws.rs.client, javax.ws.rs.container |
JavaJAXWS | 2.1 | 224 | 6 | | javax.xml.ws, javax.xml.ws.handler, javax.xml.ws.handler.soap, javax.xml.ws.http, javax.xml.ws.soap, javax.xml.ws.spi, javax.xml.ws.wsaddressing |
JavaJAXWS | 2.2 | 224 | 7/8 | 6/7 | javax.xml.ws javax.xml.ws.handler, javax.xml.ws.handler.soap, javax.xml.ws.http, javax.xml.ws.soap, javax.xml.ws.spi, javax.xml.ws.spi.http, javax.xml.ws.wsaddressing | Compatible with 2.1
JavaJCA | 1.5 | 112 | | | javax.resource, javax.resource.cci, javax.resource.spi. javax.resource.spi.endpoint. javax.resource.spi.security, javax.resource.spi.work |
JavaJCA | 1.6 | 322 | | 6 | javax.resource, javax.resource.cci, javax.resource.spi, javax.resource.spi.endpoint, javax.resource.spi.security, javax.resource.spi.work | Compatible with 1.5
JavaJCA | 1.7 | 322 | | 7 | javax.resource, javax.resource.cci, javax.resource.spi, javax.resource.spi.endpoint, javax.resource.spi.security, javax.resource.spi.work | Compatible with 1.5 & 1.6
JavaJMS | 1.1 | 914 | | 6 | javax.jms |
JavaJMS | 2 | 343 | | 7 | javax.jms | Compatible with 1.1
JavaJPA | 1 | 220 | | | javax.persistence, javax.persistence.spi |
JavaJPA | 2 | 317 | | 6 | javax.persistence, javax.persistence.criteria, javax.persistence.metamodel, javax.persistence.spi | Compatible with 1
JavaJPA | 2.1 | 338 | | 7 | javax.persistence, javax.persistence.criteria, javax.persistence.metamodel, javax.persistence.spi | Compatible with 1, 2
JavaJSF | 2 | 314 | | 6 | javax.faces, javax.faces.application, javax.faces.bean, javax.faces.component, javax.faces.component.behavior, javax.faces.component.html, javax.faces.component.visit, javax.faces.context, javax.faces.convert, javax.faces.el, javax.faces.event, javax.faces.lifecycle, javax.faces.model, javax.faces.render, javax.faces.validator, javax.faces.view, javax.faces.view.facelets, javax.faces.webapp |
JavaJSF | 2.2 | 314 | | 7 | javax.faces, javax.faces.application, javax.faces.bean, javax.faces.component, javax.faces.component.behavior, javax.faces.component.html, javax.faces.component.visit, javax.faces.context, javax.faces.convert, javax.faces.el, javax.faces.event, javax.faces.flow, javax.faces.flow.builder, javax.faces.lifecycle, javax.faces.model, javax.faces.render, javax.faces.validator, javax.faces.view, javax.faces.view.facelets, javax.faces.webapp | Compatible with 2.0
JavaJSONP | 1 | 353 | | 7 | javax.json, javax.json.spi, javax.json.stream |
JavaJSP | 2 | 152 | | | javax.servlet.jsp, javax.servlet.jsp.el, javax.servlet.jsp.tagext |
JavaJSP | 2.1 | 245 | | | javax.servlet.jsp, javax.servlet.jsp.el, javax.servlet.jsp.tagext | Compatible with 2
JavaJSP | 2.2 | 245 | | 6 | javax.servlet.jsp, javax.servlet.jsp.el, javax.servlet.jsp.tagext | Compatible with 2, 2.1. I removed javax.servlet.jsp.resources ???
JavaJSP | 2.3 | 245 | | 7 | javax.servlet.jsp, javax.servlet.jsp.el, javax.servlet.jsp.tagext | Compatible with 2, 2.1, 2.2
JavaJSTL | 1 | 52 | | | javax.servlet.jsp.jstl.core, javax.servlet.jsp.jstl.fmt, javax.servlet.jsp.jstl.sql, javax.servlet.jsp.jstl.tlv |
JavaJSTL | 1.1 | 52 | | | javax.servlet.jsp.jstl.core, javax.servlet.jsp.jstl.fmt, javax.servlet.jsp.jstl.sql, javax.servlet.jsp.jstl.tlv | Compatible with 1
JavaJSTL | 1.2 | 52 | | 6/7 | javax.servlet.jsp.jstl.core, javax.servlet.jsp.jstl.fmt, javax.servlet.jsp.jstl.sql, javax.servlet.jsp.jstl.tlv | Compatible with 1.1
JavaJTA | 1.1 | 907 | | 6 | javax.transaction, javax.transaction.xa |
JavaJTA | 1.2 | 907 | | 7 | javax.transaction, javax.transaction.xa | Compatible with 1.1
JavaJTAJRE | 1.1 | 907 | 6/7/8 | | javax.transaction, javax.transaction.xa | This contains a subset of the package javax.transaction. It only contains 3 exceptions. A provider of JavaJTA must also provide this contract. The OSGi system bundle must provide this contract. The creation of JTA 1.2 has so far not affected the SE subset and so there is currently no 1.2 version of this contract.
JavaMail | 1.4 | 919 | | 6 | javax.mail, javax.mail.event, javax.mail.internet, javax.mail.search, javax.mail.util |
JavaMail | 1.5 | 919 | | 7 | javax.mail, javax.mail.event, javax.mail.internet, javax.mail.search, javax.mail.util | Compatible with 1.4
JavaServlet | 2.5 | 154 | | | javax.servlet, javax.servlet.http |
JavaServlet | 3 | 315 | | 6 | javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http | Compatible with 2.5
JavaServlet | 3.1 | 340 | | 7 | javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http | Compatible with 2.5, 3
JavaWebServicesMetadata | 2.0 | 181 | 6/7/8 | | javax.jws, javax.jws.soap |
JavaWebServicesMetadata | 2.1 | 181 | | 6/7 | javax.jws, javax.jws.soap |
JavaWebSockets | 1 | 356 | | 7 | javax.websocket, javax.websocket.server

### Examples

A bundle that provides servlet packages unversioned

```
Bundle-SymbolicName: jee.vendor1
Bundle-Version: 3
Export-Package: javax.servlet, javax.servlet.annotation,
 javax.servlet.descriptor, javax.servlet.http
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:List<Version>="3,2.5";
 uses:="javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http"
```

A bundle that provides servlet packages using semantic versions

```
Bundle-SymbolicName: jee.vendor2
Bundle-Version: 3
Export-Package: javax.servlet; version=2.6, javax.servlet.annotation; version=2.6,
 javax.servlet.descriptor; version=2.6, javax.servlet.http; version=2.6,
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:List<Version>="3,2.5";
 uses:="javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http"
```

A bundle that provides servlet packages using specification marketing versions

```
Bundle-SymbolicName: jee.vendor3
Bundle-Version: 3
Export-Package: javax.servlet; version=3, javax.servlet.annotation; version=3,
 javax.servlet.descriptor; version=3, javax.servlet.http; version=3,
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:List<Version>="3,2.5";
 uses:="javax.servlet, javax.servlet.annotation, javax.servlet.descriptor, javax.servlet.http"
```

A bundle that provides JavaServlet 2.5, but not 3

```
Bundle-SymbolicName: jee.vendor4
Bundle-Version: 2.5
Export-Package: javax.servlet; version=2.5, javax.servlet.http; version=2.5
Provide-Capability: osgi.contract; osgi.contract=JavaServlet; version:Version=2.5;
 uses:="javax.servlet, javax.servlet.http"
```

A bundle that uses JavaServlet 2.5

```
Bundle-SymbolicName: my.company.wab2
Bundle-Version: 2
Import-Package: javax.servlet, javax.servlet.http
Require-Capability: osgi.contract; filter:="(&(osgi.contract=JavaServlet)
 (version=2.5))"
```

A bundle that uses JavaServlet 3

```
Bundle-SymbolicName: my.company.wab
Bundle-Version: 2
Import-Package: javax.servlet, javax.servlet.http
Require-Capability: osgi.contract; filter:="(&(osgi.contract=JavaServlet)
 (version=3.0))"
```

### References

[Semantic Versioning Whitepaper][SemVer]

[SemVer]: /whitepaper/semantic-versioning/
