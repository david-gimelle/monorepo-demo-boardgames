package org.boardgames;

public class Game {
    private String name;
    private String origin;
    private boolean played;

    public Game(String name, String origin, boolean played) {
        this.name = name;
        this.origin = origin;
        this.played = played;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public boolean isPlayed() {
        return played;
    }

    public void setPlayed(boolean played) {
        this.played = played;
    }
}