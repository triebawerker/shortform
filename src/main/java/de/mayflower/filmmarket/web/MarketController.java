package de.mayflower.filmmarket.web;

import de.mayflower.filmmarket.domain.Market;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/markets")
@Controller
@RooWebScaffold(path = "markets", formBackingObject = Market.class)
public class MarketController {
}
