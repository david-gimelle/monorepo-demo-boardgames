package org.boardgames;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(Controller.class)
public class ControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testGetGames() throws Exception {
        mockMvc.perform(get("/boardgames"))
                .andExpect(status().isOk())
                .andExpect(content().json("[{\"name\":\"Azul\",\"origin\":\"java App\",\"played\":false},{\"name\":\"CodeNames\",\"origin\":\"java App\",\"played\":false}]"));
    }
}