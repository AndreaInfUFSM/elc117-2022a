package com.mygdx.game;

import java.util.ArrayList;

public class Board {
  public String success;
  private ArrayList<Score> response;

  public Board() {
  }
  public Board(ArrayList<Score> response) {
    this.response = response;
  }
  public String getSuccess() {
    return this.success;
  }
  public void setSuccess(String success) {
    this.success = success;
  }
  public ArrayList<Score> getResponse() {
    return this.response;
  }
  public void setResponse(ArrayList<Score> response) {
    this.response = response;
  }
}