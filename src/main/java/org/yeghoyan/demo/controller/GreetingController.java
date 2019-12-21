package org.yeghoyan.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
public class GreetingController {

    /**
     * Get hello world messsage
     */
    @GetMapping("/")
    public String get() {
        return "Pet Shop here!";
    }
}