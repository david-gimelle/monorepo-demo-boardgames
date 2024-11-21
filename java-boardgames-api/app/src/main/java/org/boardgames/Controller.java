package org.boardgames;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Arrays;

@RestController
public class Controller {


    @GetMapping("/ping")
    public String ping() {
        return "pong";
    }

    @CrossOrigin(origins = "${cors.allowed-origins}")
    @GetMapping("/boardgames")
    public List<Game> getGames() {
        return Arrays.asList(
            new Game("Azul", "java App", false),
            new Game("CodeNames", "java App", false)
        );
    }
}