package com.mygdx.game;

public class Score {
  private String timestamp;
  private String userId;
  private String score;
  
  public Score() {
  }

  public Score(String timestamp, String userId, String score) {
    this.timestamp = timestamp;
    this.userId = userId;
    this.score = score;
  }

  public String getTimestamp() {
    return this.timestamp;
  }

  public void setTimestamp(String timestamp) {
    this.timestamp = timestamp;
  }

  public String getUserId() {
    return this.userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getScore() {
    return this.score;
  }

  public void setScore(String score) {
    this.score = score;
  }

  @Override
  public String toString() {
    return timestamp + "," + userId + "," + score;
  }
}
