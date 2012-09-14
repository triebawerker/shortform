// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.mayflower.filmmarket.web;

import de.mayflower.filmmarket.domain.Market;
import de.mayflower.filmmarket.domain.ShortForm;
import de.mayflower.filmmarket.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Market, String> ApplicationConversionServiceFactoryBean.getMarketToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<de.mayflower.filmmarket.domain.Market, java.lang.String>() {
            public String convert(Market market) {
                return new StringBuilder().append(market.getName()).append(' ').append(market.getFromDate()).append(' ').append(market.getToDate()).append(' ').append(market.getBudget()).toString();
            }
        };
    }
    
    public Converter<Long, Market> ApplicationConversionServiceFactoryBean.getIdToMarketConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, de.mayflower.filmmarket.domain.Market>() {
            public de.mayflower.filmmarket.domain.Market convert(java.lang.Long id) {
                return Market.findMarket(id);
            }
        };
    }
    
    public Converter<String, Market> ApplicationConversionServiceFactoryBean.getStringToMarketConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, de.mayflower.filmmarket.domain.Market>() {
            public de.mayflower.filmmarket.domain.Market convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Market.class);
            }
        };
    }
    
    public Converter<ShortForm, String> ApplicationConversionServiceFactoryBean.getShortFormToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<de.mayflower.filmmarket.domain.ShortForm, java.lang.String>() {
            public String convert(ShortForm shortForm) {
                return new StringBuilder().append(shortForm.getLicensor()).append(' ').append(shortForm.getLicensee()).append(' ').append(shortForm.getFromDate()).append(' ').append(shortForm.getToDate()).toString();
            }
        };
    }
    
    public Converter<Long, ShortForm> ApplicationConversionServiceFactoryBean.getIdToShortFormConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, de.mayflower.filmmarket.domain.ShortForm>() {
            public de.mayflower.filmmarket.domain.ShortForm convert(java.lang.Long id) {
                return ShortForm.findShortForm(id);
            }
        };
    }
    
    public Converter<String, ShortForm> ApplicationConversionServiceFactoryBean.getStringToShortFormConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, de.mayflower.filmmarket.domain.ShortForm>() {
            public de.mayflower.filmmarket.domain.ShortForm convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ShortForm.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getMarketToStringConverter());
        registry.addConverter(getIdToMarketConverter());
        registry.addConverter(getStringToMarketConverter());
        registry.addConverter(getShortFormToStringConverter());
        registry.addConverter(getIdToShortFormConverter());
        registry.addConverter(getStringToShortFormConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}