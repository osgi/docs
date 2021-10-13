---
title: OSGi XML Schemas
summary: OSGi™ XML Schemas
layout: toc-page
---

![Image of OSGi Logo](/img/OSGi_WG.png)

## XML Schemas

The XML schema files are made available under the [Apache License, Version 2.0](https://opensource.org/licenses/Apache-2.0).

### Declarative Services

The Declarative Services [schema](scr/v1.5.0/scr.xsd) is in the XML namespace

```
http://www.osgi.org/xmlns/scr/v1.5.0
```

This XML Schema for component descriptions is used by the Service Component Runtime (SCR). Component description documents may be embedded in other XML documents. The SCR will process all XML documents listed in the Service-Component manifest header of a bundle. XML documents containing component descriptions may contain a single, root component element or one or more component elements embedded in a larger document. Use of the namespace is mandatory.

Implementations of SCR must not require component descriptions to specify the subelements of the component element in the order as required by the schema. SCR implementations must allow other orderings since arbitrary orderings do not affect the meaning of the component description. Only the relative ordering of property and properties element have meaning.

### Blueprint Container

The Blueprint [schema](blueprint/v1.0.0/blueprint.xsd) is in the XML namespace

```
http://www.osgi.org/xmlns/blueprint/v1.0.0
```

This XML Schema is for the OSGi Blueprint Container 1.0. Blueprint configuration files using this schema must indicate the schema using the namespace. “bp” is the recommended namespace prefix.

### Metatype

The Metatype [schema](metatype/v1.4.0/metatype.xsd) is in the XML namespace

```
http://www.osgi.org/xmlns/metatype/v1.4.0
```

The schema is not intended to be used during runtime for validating meta type resources. The schema is intended to be used by tools and external management systems. The name space abbreviation should be metatype.

### Application Descriptor

The application descriptor [schema](app/v1.1.0/app.xsd) is in the XML namespace

```
http://www.osgi.org/xmlns/app/v1.1.0
```

### Remote Services Admin Endpoint Descriptor

The Remote Services Admin Endpoint Descriptor [schema](rsa/v1.0.0/rsa.xsd) is in the XML namespace

```
http://www.osgi.org/xmlns/rsa/v1.0.0
```

### Repository

The Repository schema [schema](repository/v1.0.0/repository.xsd) is in the XML namespace

```
http://www.osgi.org/xmlns/repository/v1.0.0
```

The schema provides a commonly recognized format for interchanging Repository metadata.

### REST

The REST schema [schema](rest/v1.0.0/rest.xsd) is in the XML namespace

```
http://www.osgi.org/xmlns/rest/v1.0.0
```

The schema defines the XML representation for the REST Management Service Specification.
