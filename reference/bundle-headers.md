---
title: OSGi Bundle Headers
summary: OSGi™ Bundle Headers
layout: toc-page
---

## Bundle Headers Reference

This section contains a registry for reserved header names in the OSGi Specification.

Header | Attributes and Directives | Organization
-------|---------------------------|------------
**Bundle-ActivationPolicy** | lazy: | OSGi Alliance
**Bundle-Activator** | | OSGi Alliance
**Bundle-Category** | | OSGi Alliance
**Bundle-Classpath** | | OSGi Alliance
**Bundle-ContactAddress** | | OSGi Alliance
**Bundle-Copyright** | | OSGi Alliance
**Bundle-Description** | | OSGi Alliance
**Bundle-DocURL** | | OSGi Alliance
**Bundle-Icon** | size | OSGi Alliance
**Bundle-License** | description, link | OSGi Alliance
**Bundle-Localization** | | OSGi Alliance
**Bundle-ManifestVersion** | | OSGi Alliance
**Bundle-Name** | | OSGi Alliance
**Bundle-NativeCode** | language, osname, osversion, processor, selection-filter | OSGi Alliance
**Bundle-RequiredExecutionEnvironment** | | OSGi Alliance
**Bundle-SymbolicName** | singleton: | OSGi Alliance
**Bundle-UpdateLocation** | | OSGi Alliance
**Bundle-Vendor** | | OSGi Alliance
**Bundle-Version** | | OSGi Alliance
**DynamicImport-Package** | bundle-version, version | OSGi Alliance
**Eclipse-BuddyPolicy** | | Eclipse Foundation
**Eclipse-BundleShape** | | Eclipse Foundation
**Eclipse-ExtensibleAPI** | | Eclipse Foundation
**Eclipse-PlatformFilter** | | Eclipse Foundation
**Eclipse-RegisterBuddy** | | Eclipse Foundation
**Export-Package** | bundle-symbolic-name, bundle-version, exclude:, include:, specification-version, uses:, version | OSGi Alliance
**Export-Package** | x-internal:, x-friends: | Eclipse Foundation
**Export-Service** | | OSGi Alliance
**Fragment-Host** | bundle-version, extension: | OSGi Alliance
**Import-Bundle** | import-scope:, version | SpringSource
**Import-Library** | import-scope:, version | SpringSource
**Import-Package** | bundle-symbolic-name, bundle-version, resolution:, specification-version, version | OSGi Alliance
**Import-Service** | | OSGi Alliance
**Include-Resource** | extra, literal | aQute
**Module-Scope** | | SpringSource
**Module-Type** | | SpringSource
**Private-Package** | | aQute
**Provide-Capability** | effective:[^1], uses: | OSGi Alliance
**Require-Bundle** | bundle-version, resolution:, visibility: | OSGi Alliance
**Require-Capability** | effective:[^1], filter:, resolve: | OSGi Alliance
**Web-ContextPath** | | SpringSource
**Web-DispatcherServletUrlPatterns** | | SpringSource
**Web-FilterMappings** | | SpringSource

[^1]: Reserved names for effective: directive is **resolve**.
