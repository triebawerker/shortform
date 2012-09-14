// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.mayflower.filmmarket.domain;

import de.mayflower.filmmarket.domain.Market;
import de.mayflower.filmmarket.domain.ShortForm;
import de.mayflower.filmmarket.domain.ShortFormDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ShortFormDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ShortFormDataOnDemand: @Component;
    
    private Random ShortFormDataOnDemand.rnd = new SecureRandom();
    
    private List<ShortForm> ShortFormDataOnDemand.data;
    
    public ShortForm ShortFormDataOnDemand.getNewTransientShortForm(int index) {
        ShortForm obj = new ShortForm();
        setCountry(obj, index);
        setFromDate(obj, index);
        setLicensee(obj, index);
        setLicensefee(obj, index);
        setLicenseright(obj, index);
        setLicensor(obj, index);
        setMarket(obj, index);
        setToDate(obj, index);
        return obj;
    }
    
    public void ShortFormDataOnDemand.setCountry(ShortForm obj, int index) {
        String country = "country_" + index;
        obj.setCountry(country);
    }
    
    public void ShortFormDataOnDemand.setFromDate(ShortForm obj, int index) {
        Date fromDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFromDate(fromDate);
    }
    
    public void ShortFormDataOnDemand.setLicensee(ShortForm obj, int index) {
        String licensee = "licensee_" + index;
        obj.setLicensee(licensee);
    }
    
    public void ShortFormDataOnDemand.setLicensefee(ShortForm obj, int index) {
        Long licensefee = new Integer(index).longValue();
        obj.setLicensefee(licensefee);
    }
    
    public void ShortFormDataOnDemand.setLicenseright(ShortForm obj, int index) {
        String licenseright = "licenseright_" + index;
        obj.setLicenseright(licenseright);
    }
    
    public void ShortFormDataOnDemand.setLicensor(ShortForm obj, int index) {
        String licensor = "licensor_" + index;
        obj.setLicensor(licensor);
    }
    
    public void ShortFormDataOnDemand.setMarket(ShortForm obj, int index) {
        Market market = null;
        obj.setMarket(market);
    }
    
    public void ShortFormDataOnDemand.setToDate(ShortForm obj, int index) {
        Date toDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setToDate(toDate);
    }
    
    public ShortForm ShortFormDataOnDemand.getSpecificShortForm(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ShortForm obj = data.get(index);
        Long id = obj.getId();
        return ShortForm.findShortForm(id);
    }
    
    public ShortForm ShortFormDataOnDemand.getRandomShortForm() {
        init();
        ShortForm obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ShortForm.findShortForm(id);
    }
    
    public boolean ShortFormDataOnDemand.modifyShortForm(ShortForm obj) {
        return false;
    }
    
    public void ShortFormDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ShortForm.findShortFormEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ShortForm' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ShortForm>();
        for (int i = 0; i < 10; i++) {
            ShortForm obj = getNewTransientShortForm(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}