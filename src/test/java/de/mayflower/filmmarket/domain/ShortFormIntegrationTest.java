package de.mayflower.filmmarket.domain;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = ShortForm.class)
public class ShortFormIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
    
    @Test
    public void testShortForm()
    {
    	ShortForm shortForm = new ShortForm();
    	shortForm.setLicensee("Lizenznehmer");
    	shortForm.setLicensor("Lizenzgeber");
    	shortForm.setLicensefee(50L);
    	shortForm.persist();
    	shortForm.flush();
    	shortForm.clear();
    	
    	Assert.assertNotNull(shortForm.getId());
    	Assert.assertEquals("Lizenznehmer", shortForm.getLicensee());
    	Assert.assertTrue(50L == shortForm.getLicensefee());
    }
}
