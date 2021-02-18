---
title: OSGi Bundle Headers
summary: OSGi™ Bundle Headers
layout: toc-page
---

## Bundle Headers Reference

This section contains a registry for reserved header names in the OSGi Specification.

Header | Attributes and Directives | Organization
-------|---------------------------|------------
**Bundle-ActivationPolicy** | lazy: | OSGi Working Group
**Bundle-Activator** | | OSGi Working Group
**Bundle-Category** | | OSGi Working Group
**Bundle-Classpath** | | OSGi Working Group
**Bundle-ContactAddress** | | OSGi Working Group
**Bundle-Copyright** | | OSGi Working Group
**Bundle-Description** | | OSGi Working Group
**Bundle-DocURL** | | OSGi Working Group
**Bundle-Icon** | size | OSGi Working Group
**Bundle-License** | description, link | OSGi Working Group
**Bundle-Localization** | | OSGi Working Group
**Bundle-ManifestVersion** | | OSGi Working Group
**Bundle-Name** | | OSGi Working Group
**Bundle-NativeCode** | language, osname, osversion, processor, selection-filter | OSGi Working Group
**Bundle-RequiredExecutionEnvironment** | | OSGi Working Group
**Bundle-SymbolicName** | singleton: | OSGi Working Group
**Bundle-UpdateLocation** | | OSGi Working Group
**Bundle-Vendor** | | OSGi Working Group
**Bundle-Version** | | OSGi Working Group
**DynamicImport-Package** | bundle-version, version | OSGi Working Group
**Eclipse-BuddyPolicy** | | Eclipse Foundation
**Eclipse-BundleShape** | | Eclipse Foundation
**Eclipse-ExtensibleAPI** | | Eclipse Foundation
**Eclipse-PlatformFilter** | | Eclipse Foundation
**Eclipse-RegisterBuddy** | | Eclipse Foundation
**Export-Package** | bundle-symbolic-name, bundle-version, exclude:, include:, specification-version, uses:, version | OSGi Working Group
**Export-Package** | x-internal:, x-friends: | Eclipse Foundation
**Export-Service** | | OSGi Working Group
**Fragment-Host** | bundle-version, extension: | OSGi Working Group
**Import-Bundle** | import-scope:, version | SpringSource
**Import-Library** | import-scope:, version | SpringSource
**Import-Package** | bundle-symbolic-name, bundle-version, resolution:, specification-version, version | OSGi Working Group
**Import-Service** | | OSGi Working Group
**Include-Resource** | extra, literal | aQute
**Module-Scope** | | SpringSource
**Module-Type** | | SpringSource
**Private-Package** | | aQute
**Provide-Capability** | effective:[^1], uses: | OSGi Working Group
**Require-Bundle** | bundle-version, resolution:, visibility: | OSGi Working Group
**Require-Capability** | effective:[^1], filter:, resolve: | OSGi Working Group
**Web-ContextPath** | | SpringSource
**Web-DispatcherServletUrlPatterns** | | SpringSource
**Web-FilterMappings** | | SpringSource

[^1]: Reserved names for effective: directive is **resolve**.
