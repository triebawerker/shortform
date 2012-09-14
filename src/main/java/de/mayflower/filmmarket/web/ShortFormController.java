package de.mayflower.filmmarket.web;

import de.mayflower.filmmarket.domain.ShortForm;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shortforms")
@Controller
@RooWebScaffold(path = "shortforms", formBackingObject = ShortForm.class)
public class ShortFormController {
}
