---
title: Listeners Considered Harmful - The “Whiteboard” Pattern - Conclusion
summary: Listeners Considered Harmful - The “Whiteboard” Pattern - Conclusion
layout: toc-guide-page
lprev: 040-comparison.html 
lnext: index.html
---

## Conclusion

The whiteboard pattern leverages the solid mechanisms in the OSGi framework and Declarative Services to address the dynamic life cycle of objects in the OSGi environment. It significantly simplifies handling life cycle issues. Both the Display implementation as well as the ContentProvider implementation become significantly smaller and easier to understand, and are far less prone to programming errors. And the use of Declarative Services allows the classes to be plain old Java objects (POJOs). This means the classes do not directly reference the OSGi API. The interaction with the OSGi API is fully handled by SCR.

The listener pattern attempts to put the programming rules and patterns of traditional Java application development on top of the OSGi environment. In practice, the listener pattern is not suited for the dynamic changes one can, and *must*, expect in the OSGi environment. The OSGi environment changes some of the basic programming rules with which Java programmers are familiar since it is more reactive in nature.

So why is the whiteboard pattern not always accepted at face value?

Obviously, the learning curve of the OSGi environment is a factor. The many programming patterns that apply to traditional Java applications must be reconsidered in OSGi. Newcomers to OSGi attempt to apply the standard patterns without realizing the intricacies and issues.

Another and more subtle reason might be programmer philosophy. The listener approach places the programmer of the listener fully in control. He decides the event sources with which to register his listener, and he is in charge of all the dependencies between event source and listener.

This philosophy is questionable in the OSGi environment. A bundle is not an application that runs independently from other applications. It is a component running in the framework that can collaborate with other bundles. Bundles need to be managed and configured by operators. To allow these operators to manage the bundles, bundles need to be written with the philosophy that they are being used and are not in direct control. Bundles should be written to provide a service that can be configured together with other bundles and to provide maximum composability. Often these other bundles are unknown to the designer of the original bundle. The whiteboard pattern supports the philosophy of bundles not being in direct control significantly better than the listener pattern.

All these reasons are compelling reasons to apply the whiteboard pattern whenever there is a design that requires managing inter-bundle dependencies.
