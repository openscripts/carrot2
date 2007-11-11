package org.carrot2.sandbox;

import java.util.logging.Logger;

import org.carrot2.core.Configurable;
import org.picocontainer.LifecycleStrategy;

public class RequestLifecycleStrategy implements LifecycleStrategy
{
    private final static Logger logger = Logger.getLogger(MetadataCollectorContainer.class.getName());

    @Override
    public void dispose(Object component)
    {
        logger.info("Disposing of: " + component);
    }

    @Override
    public boolean hasLifecycle(Class type)
    {
        logger.info("Has a lifecycle: " + type);
        return Configurable.class.isAssignableFrom(type);
    }

    @Override
    public void start(Object component)
    {
        logger.info("Start cycle: " + component);
        // ((Configurable) component).setup(params);
    }

    @Override
    public void stop(Object component)
    {
        logger.info("Stop cycle (cleanup): " + component);
        // ((Configurable) component).cleanup();
    }    
}
