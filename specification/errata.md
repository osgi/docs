---
title: OSGi Specification Errata
summary: OSGi™ Specification Errata
layout: toc-page
---

![Image of OSGi Logo](/img/osgi-logo-512.png)

## Core Release 7

### 3.9.5

The system bundle can export`java.*` packages in Release 7. The text is updated to remove the reference to the system bundle exporting non-`java.*` packages.

### 3.14

Bullet 3 is changed to remove the sentence: "The`bundle-version` attributes and`bundle-symbolic-name` attributes will reflect the host bundle."

### 10.8.4

The text "If the meta-annotated annotation declares an element of the same name as an element in this annotation, the element is considered to override the element in this annotation." is removed from the specification of the Capability annotation.

### 10.8.10

The text "If the meta-annotated annotation declares an element of the same name as an element in this annotation, the element is considered to override the element in this annotation." is removed from the specification of the Requirement annotation.

## Compendium Release 7

### 101.12.6

The arguments to the LoggerFactory getLogger methods must not be in null.

### 105.8

The version of the Meta Type Resource XML Schema is 1.4.0 and the namespace is `http://www.osgi.org/xmlns/metatype/v1.4.0`. The specification incorrectly included the 1.3.0 schema.

### 150.3.1

Table 150.1 is updated to correct the spelling of`:configurator:symbolic-name`. It incorrectly stated the spelling as`:configurator:symbolicname`.

### 151.4.1.1

The discussion of clashing resource mappings is updated to clarify the expected behaviour when multiple whiteboard resources provide resource methods which map to the same URI. The previous text failed to define how the ranking of these services would interact with the existing JAX-RS resource selection algorithm.

The updated text requires that higher ranked services take precedence over lower ranked services, but that equally ranked services fall back to the default JAX-RS resource method selection algorithm. It remains the case that static resources in a whiteboard application behave as if they have a ranking less than that of all whiteboard services.

### 150.11

The discussion of the osgi.identity capability is updated to correct the spelling of`:configurator:symbolic-name`. It incorrectly stated the spelling as`:configurator:symbolicname`.

## Core Release 6

### 2.4.1

Implied permissions for bundles must also include Capability Permission`REQUIRE` for the`osgi.native` capability.

### 3.12

The file`OSGI-INF/permissions.perm` was incorrectly spelled.

### 8.5

This section is updated to state that a fragment's`osgi.identity` capability is not merged with the host bundle.

## Compendium Release 6

### 112.8.2.2

Table 112.10 is updated. The boolean/Number entry is changed to "_v_.doubleValue() != 0" and the char/Number entry is changed to "(char) _v_.intValue()".

### 112.12.7.1

`getService()` throws an IllegalStateException when the component instance that received the`ComponentServiceObjects` object has been deactivated. It incorrectly stated that an IllegalStateException is thrown when the associated service has become unbound.

### 112.12.7.3

`ungetService()` throws an IllegalStateException when the component instance that received the`ComponentServiceObjects` object has been deactivated. It incorrectly stated that an IllegalStateException is thrown when the associated service has become unbound.

## Enterprise Release 6

### 122.5.1

In the returned collection of`ExportRegistration` objects, in addition to ignoring unrecognized configuration types, recognized configuration types which require intents that are not supported by the Remote Service Admin must also be ignored.

### 134.2.1.5

The attribute name is corrected to`bundle-version`.

### 134.4

The root subsystem version is 1.1.

### 134.13.1

The root subsystem version is 1.1.

### 134.15.1.8

The attribute name is corrected to`bundle-version`.

### 137.12.2.15

This method is removed.

### 137.12.2.16

The`options` parameter is optional.

### 137.12.2.17

This method is removed.

### 137.12.2.18

The`options` parameter is optional.

### 140.4

When a failure occurs during`Servlet.init()`, the system treats the servlet as unusable and attempts to find an alternative servlet matching the request. The specification incorrectly stated that the system did not attempt to find an alternative servlet.

### 140.11.2

If the Servlet API is provided by another bundle, the Http Whiteboard implementation _must_ be a consumer of the API and require the contract.

## Core Release 5

### 3.3.3

The Provide-Capability header syntax is corrected to make clear that attribute type and List element type are optional. They both default to`String`.

    typed-attr ::=  extended ( ':' type )? '=' argument
    list       ::= 'List' ( '<' scalar '>' )?

### 5.2.6

A contradiction is removed which incorrectly stated that ranking order is in ascending service.ranking order. The sentence is corrected to:

Therefore, the ranking order is in _descending_ service.ranking numeric order where ties give a preference to the earlier registrant.

### 9.2.1, 9.2.2 and 9.3.7

The specification is corrected to allow the system bundle to be adapted to`BundleStartLevel`.

### 7.4

This section is updated to state that the`osgi.identity` capability of a fragment is part of the fragment's Bundle Wiring and is not part of a host bundle's Bundle Wiring. That is, each Bundle Wiring has exactly one`osgi.identity` capability. However,`osgi.identity` requirements declared by a fragment are not part of the fragment's Bundle Wiring and are instead hosted by the host bundle's Bundle Wiring.

### 10.4.8.10

The ordering of items in the returned list is updated to state that dynamically established wires are added to the end of the list in the order they are established.

## Compendium Release 5

### 104.12.3.4

The`getChangeCount` method is corrected to state that it must throw`IllegalStateException` if this configuration is deleted.

### 112.13.3.5

The`enabled` element is incorrectly described as having the value`false` if unspecified. If unspecified, the value of`enabled` is`true`.

### 117.11.8

The description of Figure 117.22 is corrected to state that the`SESSION_OPENED` event is published when the Dmt Session is opened. The remaining events are published when the Dmt Session is closed.

### 134.18.6

`SubsystemPermission` incorrectly refers to the`Subsystem.getHeaders` method for the`metadata` action. The proper name of the method is`getSubsystemHeaders`.

## Enterprise Release 5

### 102.2

The URL example is missing the`?` before the query string. The correct URL is`http://www.acme.com/servlet?name=bugs`.

### 104.13.3.4

The`getChangeCount` method is corrected to state that it must throw`IllegalStateException` if this configuration is deleted.

### 112.13.3.5

The`enabled` element is incorrectly described as having the value`false` if unspecified. If unspecified, the value of`enabled` is`true`.

### 124.13.1.1

The`AUTORIZATION_TYPE` field is incorrectly specified to consists of the`NAME_ITEM` and`TYPE_ITEM` items. The field consists of the`NAME_ITEM` and`ROLES_ITEM` items. (The name of this field is also incorrectly spelled which will be corrected in a future release.)

### 129.2.1

The example incorrectly specifies the SCA XML namespace as`http://www.osoa.org/xmlns/sca/1.0`. The correct SCA XML namespace is`http://docs.oasis-open.org/ns/opencsa/sca/200912`.

### 134.15.10

The text incorrectly refers to the example importing a service when the example is meant to show exporting a service. In the example, the header name is incorrect and is corrected to be`Subsystem-ExportService`.

### 134.18.7

`SubsystemPermission` incorrectly refers to the`Subsystem.getHeaders` method for the`metadata` action. The proper name of the method is`getSubsystemHeaders`.

### 136

The Resolver Service Specification is incorrectly numbered. Due to a production error, the Resolver Service Specification was numbered 131 which is already used by the _TR069 Connector Service Specification_. The correct number for the Resolver Service Specification is 136 which will be used in the next release of the specification document.

## Core R4 V4.3

### 3.2.1.26

The `Provide-Capability` manifest header is incorrectly called `Provided-Capability`. The correct name is `Provide-Capability`.

### 3.3.6

The `resolution` directive is incorrectly called `resolve`. The correct name is `resolution`.

### 9.3.7.8

The ordering of items in the returned list is updated to state that dynamically established wires are added to the end of the list in the order they are established.

### 56.3.2

In step 4, the bundle class loader must throw a Class Format Error. There is no Class Format Exception.

## Compendium R4 V4.3

### 102.2

The URL example is missing the `?` before the query string. The correct URL is `http://www.acme.com/servlet?name=bugs`.

### 112.3.2

The signature of the updated method in the the source example is not valid. The example should be corrected to:

    void updatedLog( LogService l, Map<String,?> ref )

It is incorrectly stated that the `Reference` annotation will use the full method name as the default reference name. This is corrected to state that the default reference name is based upon the name of the method being annotated. If the method name begins with `bind`, `set` or `add`, that prefix is removed.

### 117.4.8

The exception code for failing attempts to set complex values to interior nodes that do not support complex values is incorrectly stated as `COMMAND_NOT_ALLOWED`. The correct code is `FEATURE_NOT_SUPPORTED`.

### 117.5.2

The description of the `DYNAMIC` scope has the incorrect text "This this not". This is corrected to "This does not".

### 117.6.9

In table 117.3, the description of method `getNodeSize()` is incorrect. The correct description is:

Must throw a DmtException COMMAND_NOT_ALLOWED

### 117.7.5

The bullet point discussing that the plugin root must be compatible with the corresponding parent’s mount point is clarified to further state: "When a Parent Plugin is available, the plugin root must match exactly to the absolute URI of the parent's mount point."

### 117.11.5

The general event property for the Bundle-SymbolicName is incorrectly called `bundle.symbolicname`. The correct name is `bundle.symbolicName`.

### 117.11.6

The paragraph is replaced with: "All session events must have the properties defined in _Event Properties for Session Event_ on page 324."

### 117.11.7

The paragraph is replaced with: "All life cycle events must have the properties defined in _Event Properties for Life Cycle Events_ on page 324."

In table 117.10, the descriptions of `exception.message` and `exception.class` incorrectly include the text "or timed out". That text is removed.

### 117.11.8

The description of Figure 117.22 is corrected to state that the `SESSION_OPENED` event is published when the Dmt Session is opened. The remaining events are published when the Dmt Session is closed.

### 117.15.11.17

The description for throwing `DmtException` with code `NODE_NOT_FOUND` is changed to:

if the node does not exist

### 117.16.6.4

The description of the `topic` parameter is incorrect. The correct description is:

the topic of the event to send. Valid values are:

* `org/osgi/service/dmt/DmtEvent/ADDED` if the change was caused by a add action

* `org/osgi/service/dmt/DmtEvent/DELETED` if the change was caused by a delete action

* `org/osgi/service/dmt/DmtEvent/REPLACED` if the change was caused by a replace action

### 119.5

The event topic name is incorrectly stated as `org/osgi/service/monitor`. The correct value is `org/osgi/service/monitor/MonitorEvent`.

### 119.7.2

The maximum length of the pid is incorrectly stated as 20. The maximum length is 32 as stated in 119.2.

## Residential R4 V4.3

### 2.7.1

`FaultType` and `FaultMessage` are incorrectly listed as mandatory. They are optional and the correct cardinality is `0,1`.

The type of `LastModified` is incorrectly listed as `dateTime`. It is corrected to `date_time`.

### 2.7.2

The type of the list elements of `Filter/ResultUriList` is corrected to be `string`. It was incorrectly listed as `node_uri`.

### 2.7.3

The type of `Time` is incorrectly listed as `dateTime`. It is corrected to `date_time`.

### 2.8.2

In table 2.4, the description of `Wires/[String]/[list]` incorrectly refers to a non-existent `osgi.wiring.service` namespace. The text is changed to refer to the `osgi.wiring.rmt.service` namespace.

In table 2.4, the type of `LastModified` is incorrectly listed as `datetime`. It is corrected to `date_time`.

### 2.8.5

In the paragraph after the description of wild cards, it is incorrectly stated that the Target node is a virtual sub-tree. The description is corrected to state that the Result node is a virtual sub-tree.

In table 2.7, the type of the list elements of `ResultUriList` is corrected to be `string`. It was incorrectly listed as `node_uri`.

In table 2.7, the `Target` element description is corrected to state that it is an absolute URI and the `Result` element description is corrected to remove the reference to the `Target` element containing a relative URI. The `Result` element acts as a parent node instead of the session root for each node in `N`.

### 2.8.6

In table 2.8, the description of `StartLevel` incorrectly refers to Bundle Start Level. The correct referral is to Framework Start Level.

### 2.8.8

In table 2.10, the description of `Directive` is corrected to be "The Directives for this capability".

### 2.9.2

In table 2.13, the type of `Time` is incorrectly listed as `datetime`. It is corrected to `date_time`.

### 3

TR-157 Amendment 3 Software Module Guidelines specification is missing a specification version number. It is Version 1.0.

### 131.4.4

The MIME type in the fourth paragraph is incorrectly stated as `application/x-tr-68-eager`. The correct MIME type is `application/x-tr-69-eager`.

The final sentence, "The addObject(String) method does not require an atomic session", is incorrect. It must be replaced with "The addObject(String) method requires an atomic session. If a non-atomic session is used then the addObject(String) must not attempt to create any objects and an exception must be thrown."

### 131.8.3.4

The following text is added to the method description:

If this is a table path, the method specifies whether or not AddObject would be successful. If the parameter path points to a table instance, the method specifies whether or not DeleteObject would be successful.

### 131.8.5.29

`TR069_BOOLEAN` is added as a valid argument for the `type` parameter.

## Service Platform Core R4 V4.2

### 4.4.2

In figure 4.28, the edge from RESOLVED to UNINSTALLED should not be present. When uninstalling a bundle, the bundle must transition through the INSTALLED state on the way to the UNINSTALLED state.

### 4.5.3

In table 4.3, the description of the processor names ia64n and ia64w are reversed. ia64n is 32-bit and ia64w is 64-bit.

### 8.2.3

FrameworkEvent.STARTLEVEL_CHANGED is incorrectly spelled as START_LEVEL_CHANGED.

## Service Platform Compendium R4 V4.2

### 102.2

The URL example is missing the `?` before the query string. The correct URL is `http://www.acme.com/servlet?name=bugs`.

### 104.3

org.osgi.framework.Constants.SERVICE_PID is incorrectly spelled as SERVICE.PID.

### 113.5

First code example handles the InterruptedException incorrectly. It must return in the catch block, not ignore the interrupt because the interrupt flag is cleared before the catch block.

### 114.8

A missing step is added after step 3: Process the localization files, see _Localization_.

### 119.7.2

The maximum length of the pid is incorrectly stated as 20. The maximum length is 32 as stated in 119.2.

## Service Platform Enterprise R4 V4.2

### 1.3

Table 1.1 incorrectly refers to Auto Configuration Specification and Application Admin Specification which are not included in the Enterprise Specification.

### 121.2.6

Two examples incorrectly use "value" attributes instead of "ref" attributes to refer to other beans.

### 121.2.6

The sentence "User code that causes a dynamic cycle by recursively calling the getComponentInstance method must be detected and cause a failure, these cycles cannot be broken." is deleted.

### 121.3.11

In the steps describing how Blueprint Containers are destroyed when the Blueprint extender is stopped, the first bullet in step 3 is changed to: "The registered service that is in use with the lowest ranking number, or if a tie".

### 121.5.7

It was stated that overloaded property set methods must not be used. This is relaxed. The sentence now reads: "There should only be one set method with a single argument for a specific property. If overloaded properties are encountered, the chosen set method is unspecified."

### 121.6

A service manager can get component instances for its service properties while its explicit dependencies are not yet activated. A service manager must therefore activate its explicit dependencies at the beginning of the service registration phase. This does not have to cause the activation of the service manager itself. This change affects several sections of the specification.

* 121.2 Added that an explicit dependency on a service manager is now also a trigger.
* 121.2.3 Indicated service managers activate their dependencies always eagerly now.
* 121.2.4 Made the timing of the explicit dependency activation manager type specific.
* 121.3.2.1 Step 10: Indicated that explicit dependencies must be activated for a service manager before any other activity.
* 121.3.6 Made it explicit that service reference managers do not activate dependencies until they are activated.
* 121.3.8 Indicated the activation of explicit dependencies.
* 121.3.13 Indicated that an explicit dependency on a service manager is now eager.
* 121.4.9 Indicated that explicit dependency activation is in general before activation but can be overridden on a per manager type basis.
* 121.6.1 Table 121.5: Changed the text of depends-on to indicate the earlier time of dependency activation.
* 121.6 Added new section (121.6.3) outlining the exception of initializing the dependencies early.

Note: A reference manager is unchanged. It must delay activation of its explicit dependencies until it is activated because activation in the tracking references phase would create components before the grace period. And a reference manager can currently have no implicit dependencies except for the listeners that are initialized when the reference manager is activated, so the general rule to activate explicit dependencies before activation should apply.

### 121.6

Cycles must be broken when a breaking manager can be found, where a breaking manager can be a singleton or a prototype bean. However, a prototype bean can never be a breaking manager because it must always return a new object. Breaking managers must therefore always be a singleton. This implies that self injection for a prototype bean cannot work because the cycle does not contain a singleton breaking manager.

### 121.6.6

(was 121.6.5) "Service properties creation can have side effects because they can use component instances. The service properties must therefore be created once before the first time the first time the service is registered." is added to the end of the first paragraph.

### 121.7.3

Table 121.9 is referenced incorrectly. The correct reference is to table 121.10.

### 121.7.4

In table 121.11, the second bind-method in the first column should be unbind-method.

### 121.8.3

In table 121.14, the type element row, indicates that it will return the collection's value type if available. This is wrong, null must be returned when not set and the collection's value type must be obtained through the appropriate Collection Metadata.

### 121.15

The scope attribute of the Tinlined-bean type is changed to remove

'fixed="prototype"'.

### 121.15

The definition of the Tscope type is changed to:

```xsd
<xsd:simpleType name="Tscope">
    <xsd:union>
        <xsd:simpleType>
            <xsd:restriction base="xsd:NMTOKEN">
                <xsd:enumeration value="singleton" />
                <xsd:enumeration value="prototype" />
            </xsd:restriction>
        </xsd:simpleType>
        <xsd:simpleType>
            <xsd:restriction base="xsd:QName">
                <xsd:pattern value=".+:.+" />
            </xsd:restriction>
        </xsd:simpleType>
    </xsd:union>
</xsd:simpleType>
```

### 121.16

It is suggested to use the use of the getAccessControlContext method of Conditional Permission Admin to get a proper Access Control Context for a bundle. However, this method is only suited if signatures are known and is not suitable for getting an Access Control Context for a bundle. The proper solution is to create an Access Control Context that uses a custom ProtectionDomain. This section also failed to list the permissions required by a Blueprint bundle. A Blueprint bundle must have ServicePermission(...BlueprintContainer,[REGISTER]) in addition to any other permissions required by its code.

### 121.17.3.9 and 121.17.3.11

The dependencies parameter is optional for event type FAILURE. That is, for event type FAILURE, the dependencies parameter may be null.

### 121.18.3

The description of the return value of the getScope method is updated to add: "Returns null if the scope has not been explicitly specified in the bean definition."

### 124.5.4

Incorrectly refers to the PROPERTIES item which does not exist.

### 124.9.2.31

The correct value of the field PERSISTENTLY_STARTED is PersistentlyStarted. It was incorrectly spelled PeristentlyStarted.

### 124.9.3.5

The correct type of the item described by BUNDLE_IN_ERROR_LOCATION_ITEM is SimpleType.STRING.

### 124.9.3.23

The description of the bundleIdentifiers parameter is changed to specify that an argument of null can be used for all bundles with packages pending removal.

### 124.9.3.25

The description of the bundleIdentifiers parameter is changed to specify that an argument of null can be used for all unresolved bundles.

### 124.9.5.14

The PROPERTIES field does not exist and is deleted.

### 124.9.5.15

The PROPERTIES_ITEM field does not exist and is deleted.

### 124.9.5.17

Incorrectly refers to the PROPERTIES item which does not exist.

### 124.13.1.27

The createRole method was specified in error and is deprecated. It does not function and must not be used. Use either createUser or createGroup. Implementations of the createRole method will throw an exception.

### 126.6

The syntax for a service/serviceList URL lookup allowed JNDI names to be mixed with filters. This caused confusion because JNDI names have no syntax. The URL scheme grammar is changed to only allow filters on fqns.

```bnf
service ::= ’osgi:service/’ query
query ::= jndi-name | fqn ( ’/’ filter )?
jndi-name ::= <any string>

servicelist ::= ’osgi:servicelist/’ query?
```

### 126.3.2

This states "Service ranking order is achieved by sorting on ascending service.ranking service property and then descending service.id property." The intention was to then pick the last element but this was not clearly stated. The wording is changed to follow the Core Specification's definition in table 5.2. "If multiple qualifying service interfaces exist, a service with the highest SERVICE_RANKING number, or when equal to the lowest SERVICE_ID, determines which service object is returned by the Framework."

### 127.5.4

To correct the incorrect use of some terms, this section is replaced with:

"In this specification, the Entity Manager Factory service is only registered when the Persistence Unit is complete and a matching Data Source Factory service is available. However, the API of the Entity Manager Factory Builder allows the creation of an Entity Manager Factory with configuration properties. Those configuration properties could contain the JDBC properties to bind to another Data Source Factory service than it had already selected.
This case must not be supported by a JPA Provider, an Illegal Argument Exception must be thrown. If such a case would be supported then the life cycle of the Entity Manager Factory service would still be bound to the first Data Source Factory. There would be no way for the JPA Provider to signal to the Client Bundle that the returned Entity Manager Factory is no longer valid because the rebound Data Source Factory was unregistered.

Therefore, when an Entity Manager Factory is being created using the Entity Manager Factory Builder, a JPA Provider must verify that the new properties are compatible with the properties of the already created Entity Manager Factory. If no, then an Exception must be thrown. If they are compatible, then an instance of the previous Entity Manager Factory should be returned."

### 128.4.1

Incorrectly says `ampersand (’?’)`. This is changed to `ampersand (’&’)`.

### 128.4.1 and 128.4.2

Examples use `Bundle-SymoblicName` which is misspelled. The examples are changed to use `Bundle-SymbolicName`.

### 128.4.5

Incorrectly says `WEB-INF/classes/`. This is changed to `WEB-INF/classes` (no trailing slash).

### 128.5

The description of `collision.bundles` is corrected to: "`(Collection<Long>)` If a name collision occurred, a collection of bundle ids that all have the same value for the Web-ContextPath manifest header."

## Service Platform Core R4 V4.1

### 3.14.2

Fragments During Runtime. Erroneously specified that fragments could become unresolved due to calling resolveBundles

### 6.1.4.29

Steps 4 and 7 are updated to reflect lazy activation.

4 - If this bundle's state is not `STARTING` or `ACTIVE` then this method returns immediately.

7 - If this bundle's state was `ACTIVE` prior to setting the state to `STOPPING`, the stop method of this bundle's `BundleActivator`, if one is specified, is called. If that method throws an exception, this method must continue to stop this bundle and a `BundleException` must be thrown after completion of the remaining steps.

### 6.1.14.3-5

The source of the `PACKAGE_REFRESHED`, `STARTED` and `STARTLEVEL_CHANGED`FrameworkEvent types is the System Bundle.

## Service Platform Compendium R4 V4.1

### 104.5.3

The following step was incorrectly added to the specification and has been removed.

~~A Configuration Event CM_UPDATED is send asynchronously out to all registered Configuration Listener services.~~

### 104.8

A Configuration Event CM_UPDATED in only sent when a Configuration is updated. No Configuration Event is sent when a Configuration is created.

### 112.10

In the XML Schema, the property type of `Character` is incorrectly listed at `Char`.

### 113.6.1

Table 113.23 contains a misspelling of EXCEPTION_CLASS. Also, the notes for EXCEPTION_CLASS and EXCEPTION_MESSAGE are reversed.

### 113.12.5

The code example has some minor bugs in it. `EventConstants.EVENT_TOPIC` should not be in the `topics` array and the key used for putting the `topics` array in the hashtable should be `EventConstants.EVENT_TOPIC`.

### 704.4.1

The Measurement compendium specification talks about a String constructor for the Measurement class. This constructor does not exist.

## Service Platform Core R4 V4.0

_The following errata from the original version of the R4 Core specification have been corrected in the Version 4.0.1 document._

### 1.2

The bullet on signed bundles incorrectly refers to Package Admin. It should refer to Permission Admin.

### 3.2.1.8

The paragraph incorrectly refers to a Bundle-Location header. It should refer to the Bundle-Localization header.

### 3.3.1

Additional execution environment names have been defined for Java 2 SE 5.0 and Java SE 6.0. They are `J2SE-1.5` and `JavaSE-1.6`, respectively.

### 3.5.5

The description of the exclude directive incorrectly refers to resources. Only classes may be excluded or included.

### 3.16.2

The section should state that a Framework that supports Require-Bundle and/or fragments must also support Bundle Permission.

### 4.3.12

The framework may resolve a bundle during the execution of Bundle.findEntries.

### 4.8.3

The framework must not call the constructor of a BundleActivator object from within a doPrivileged region.

### 9.6

In the example code, the fields EMPTY_CS and EMPTY_PS should be arrays

```java
ConditionInfo[] EMPTY_CS = new ConditionInfo[0];
PermissionInfo[] EMPTY_PS = new PermissionInfo[0];
```

## Service Platform Compendium R4 V4.0

_The following errata from the original version of the R4 Compendium specification have been corrected in the Version 4.0.1 document._

### 104.4.2

The format of a property name should be `symbolic-name`. It is incorrectly stated as "must be". While it is recommended that property names conform to `symbolic-name`, they can be any valid String.

### 104.14

A property name is now recommended to conform to `symbolic-name`. It is incorrectly stated to be defined as `unique-name`.

### 105.1.2

Package in class diagram must be org.osgi.service.metatype, not org.osgi.service.metatyping

### 105.5

Example printing of metatypes contains syntax errors

### 105.6.2

Example MetaData element twice and incorrect. Should be merged and use default namespace

### 105.8

The `content` attribute of the `Attribute` element is not required and is changed to be optional. The bundle attribute of the `Designate` element is not required and is changed to be optional. A `Value` element is added as a child of the `Attribute` element to allow multiple values for an Attribute.

```xml
<complexType name="Attribute">
    <sequence>
        <element name="Value" type="string" minOccurs="0"
            maxOccurs="unbounded" />
    </sequence>
    <attribute name="adref" type="string" use="required" />
    <attribute name="content" type="string" use="optional" />
</complexType>
```

### 112.2.3

The component description in the example code does not properly define the event.topics property so that the value is a String array as required by the Event Admin specification. The property element should be:

```xml
<property name="event.topics">some/topic</property>
```

### 112.4.3, 112.10

The component elemement of the component description shows the subelements occuring in the following order: implementation, properties/property, service, reference. This ordering is also specified in the XML schema. SCR must not require component descriptions to specify the elements in the order listed above and as required by the XML schema. SCR must allow other orderings since arbitrary orderings of these elements do not affect the meaning of the component description. Only the relative ordering of property and properties element have meaning.

### 113.4

Example uses EVENT_TOPIC**S** instead of EVENT_TOPIC. The example with AcmeWatchDog must extend BundleActivator, not Activator

### 113.5

Timer example should have Calendar.MINUTE and Calendar.HOUR (they are now spelled with an extra S)

### 113.11.4.5

Event Handlers which do not have a value for the event.topics property must not receive events.

### 113.11.4.8

The constant name EXCEPTION_CLASS was released with an incorrect spelling. This error will be corrected in the next release and the incorrectly spelled constant name EXECPTION_CLASS will be deprecated.

### 999.4.3

The getLocalizedMessage method is incorrectly listed under java.lang.Thread. It should be listed under java.lang.Throwable.
