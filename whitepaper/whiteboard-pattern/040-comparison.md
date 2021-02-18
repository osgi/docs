---
title: Listeners Considered Harmful - The “Whiteboard” Pattern - Comparison
summary: Listeners Considered Harmful - The “Whiteboard” Pattern - Comparison
layout: toc-guide-page
lprev: 030-an-example.html 
lnext: 050-conclusion.html
---

## Comparison

The following table provides a line-by-line code comparison of the implementation with the listener versus the implementation with the whiteboard using Declarative Services.

**Table 1: Listeners versus Whiteboard**

<table style="border: 1px solid black;">
    <thead>
        <tr class="odd">
            <th style="border: 1px solid black;"><strong>Listener Pattern</strong></th>
            <th style="border: 1px solid black;"><strong>Whiteboard Pattern</strong></th>
        </tr>
    </thead>
    <tbody>
        <tr class="even">
            <td style="border: 1px solid black;">
                <pre><code>public interface Display {
  void addContentProvider( ContentProvider p );
  void removeContentProvider( ContentProvider p );
}</code></pre>
            </td>
            <td style="border: 1px solid black;"></td>
        </tr>
        <tr class="odd">
            <td style="border: 1px solid black;">
                <pre><code>public interface ContentProvider {
    String getContent();
}</code></pre>
            </td>
            <td style="border: 1px solid black;">
                <pre><code>public interface ContentProvider {
    String getContent();
}</code></pre>
            </td>
        </tr>
        <tr class="even">
            <td style="border: 1px solid black;">
                <pre><code>
class Clock implements ContentProvider {
    private final Display display;
    Clock(Display display) {
        this.display = display;
        display.addContentProvider(this);
    }
    void dispose() {
        display.removeContentProvider(this);
    }
    public String getContent() { return new Date().toString(); }
}</code></pre>
            </td>
            <td style="border: 1px solid black;">
                <pre><code>@Component
public class Clock implements ContentProvider {

    public Clock() {}






    public String getContent() { return new Date().toString(); }
}</code></pre>
            </td>
        </tr>
        <tr class="odd">
            <td style="border: 1px solid black;">
                <pre><code>class DisplayTracker extends ServiceTracker&lt;Display, Clock&gt; {
    DisplayTracker(BundleContext context) {
        super(context, Display.class, null);
    }
    public Clock addingService(ServiceReference&lt;Display&gt; ref) {
        Display display = context.getService(ref);
        return new Clock(display);
    }
    public void removedService(ServiceReference&lt;Display&gt; ref, Clock clock) {
        clock.dispose();
        context.ungetService(ref);
    }
}</code></pre>
            </td>
            <td style="border: 1px solid black;"></td>
        </tr>
        <tr class="even">
            <td style="border: 1px solid black;">
                <pre><code>public class ClockManager implements BundleActivator {
    private DisplayTracker tracker;
    public void start(BundleContext context) {
        tracker = new DisplayTracker(context);
        tracker.open();
    }
    public void stop(BundleContext context) {
        tracker.close();
    }
}</code></pre>
            </td>
            <td style="border: 1px solid black;"></td>
        </tr>
        <tr class="odd">
            <td style="border: 1px solid black;">
                <pre><code>class ContentProviderRegistration implements Display {
    private final List&lt;ContentProvider&gt; providers;
    private final DisplayManager manager;
    ContentProviderRegistration(DisplayManager manager) {
        this.manager = manager;
        providers = new ArrayList&lt;&gt;();
    }
    public synchronized void addContentProvider(ContentProvider p) {
        providers.add(p);
        manager.addContentProvider(p);
    }
    public synchronized void removeContentProvider(ContentProvider p) {
        if (providers.remove(p)) {
            manager.removeContentProvider(p);
        }
    }
    void synchronized dispose() {
        for (ContentProvider p : providers) {
            manager.removeContentProvider(p);
        }
        providers.clear();
    }
}</code></pre>
            </td>
            <td style="border: 1px solid black;"></td>
        </tr>
        <tr class="even">
            <td style="border: 1px solid black;">
                <pre><code>class DisplayFactory implements ServiceFactory&lt;Display&gt; {
    private final DisplayManager manager;
    DisplayFactory(DisplayManager manager) {
        this.manager = manager;
    }
    public Display getService(Bundle b, ServiceRegistration&lt;Display&gt; r) {
        return new ContentProviderRegistration(manager);
    }
    public void ungetService(Bundle b, ServiceRegistration&lt;Display&gt; r, Display s) {
        ContentProviderRegistration cpr = (ContentProviderRegistration) s;
        cpr.dispose();
    }
}</code></pre>
            </td>
            <td style="border: 1px solid black;"></td>
        </tr>
        <tr class="odd">
            <td style="border: 1px solid black;">
                <pre><code>
public class DisplayManager implements BundleActivator, Runnable {
    private volatile Thread thread;
    private ServiceRegistration&lt;Display&gt; registration;
    private final List&lt;ContentProvider&gt; providers = new ArrayList<>();

    public void start(BundleContext context) {
        DisplayFactory factory= new DisplayFactory(this);
        registration = context.registerService(Display.class, factory, null);
        thread = new Thread(this, "DisplayManager Listener");
        thread.start();
    }

    public void stop(BundleContext context) {
        thread = null;
    }
    public void run() {
        Thread current = Thread.currentThread();
        int n = 0;
        while (current == thread) {
            synchronized (providers) {
                if (!providers.isEmpty()) {
                    if (n >= providers.size())
                        n = 0;
                    ContentProvider cp = providers.get(n++);
                    System.out.println("LISTENER: " + cp.getContent());
                }
            }
            try { Thread.sleep(5000); } catch(InterruptedException e) {}
        }
    }
    void addContentProvider(ContentProvider p) {
        synchronized (providers) {
            providers.add(p);
        }
    }
    void removeContentProvider(ContentProvider p) {
        synchronized (providers) {
            providers.remove(p);
        }
    }
}</code></pre>
            </td>
            <td style="border: 1px solid black;">
                <pre><code>@Component(service = {})
public class DisplayManager implements Runnable {
    private volatile Thread thread;
    @Reference
    private volatile List&lt;ContentProvider&gt; providers;
    @Activate
    void activate() {


        thread = new Thread(this, "DisplayManager Component");
        thread.start();
    }
    @Deactivate
    void deactivate() {
        thread = null;
    }
    public void run() {
        Thread current = Thread.currentThread();
        int n = 0;
        while (current == thread) {
            List&lt;ContentProvider&gt; providers = this.providers;
            if (!providers.isEmpty()) {
                if (n >= providers.size())
                    n = 0;
                ContentProvider cp = providers.get(n++);
                System.out.println("COMPONENT: " + cp.getContent());
            }

            try { Thread.sleep(5000); } catch(InterruptedException e) {}
        }
    }










}</code></pre>
            </td>
        </tr>
    </tbody>
</table>

Obviously, the whiteboard approach is a significantly smaller and simpler implementation especially since we use Declarative Services to manage the lifecycle of the components and their use of services. It is even simpler than the code size suggests. What is not obvious is the fact that the listener pattern has significantly more deadlock possibilities than the whiteboard pattern.

See [GitHub](https://github.com/osgi/whiteboard-pattern) for the example code above.
