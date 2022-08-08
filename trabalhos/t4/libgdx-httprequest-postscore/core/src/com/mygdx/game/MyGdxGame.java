package com.mygdx.game;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Net;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.TextButton;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;
import com.badlogic.gdx.utils.Align;
import com.badlogic.gdx.utils.ScreenUtils;
import com.badlogic.gdx.utils.viewport.ScreenViewport;


public class MyGdxGame extends ApplicationAdapter {
  private Stage stage;
  private Label outputLabel;
  private Button button;

  @Override
  public void create() {

    stage = new Stage(new ScreenViewport());
		Gdx.input.setInputProcessor(stage);

    int row_height = Gdx.graphics.getWidth() / 12;
		int col_width = Gdx.graphics.getWidth() / 12;

    Skin skin = new Skin(Gdx.files.internal("uiskin.json"));

    // A label to show useful messages
    outputLabel = new Label("Press the Button", skin, "default");
		outputLabel.setSize(Gdx.graphics.getWidth(), row_height);
		outputLabel.setPosition(0, row_height);
		outputLabel.setAlignment(Align.center);
		stage.addActor(outputLabel);

    // A simple button showing text
		button = new TextButton("Post to LeaderBoard", skin, "default");
		button.setSize(col_width*4, row_height);
		button.setPosition(col_width*4, Gdx.graphics.getHeight()-row_height*4);
    button.setColor(0.1f, 0.1f, 0.8f, 1);
		button.addListener(new InputListener(){
      // Called when the button is released
			@Override
			public void touchUp(InputEvent event, float x, float y, int pointer, int button) {
        // Do all the HTTP magic! See further below
        postScore(outputLabel);
				
			}
      // Called when the button is pressed
			@Override
			public boolean touchDown(InputEvent event, float x, float y, int pointer, int button) {
				outputLabel.setText("Posting to LeaderBoard...");
				return true;
			}
		});
		stage.addActor(button);

  }

  // Example code using GDX to send an HTTP request to our simple LeaderBoard web service
  // Our web service is designed so that we could use an HTTP GET to post data (not a best practice), 
  // so developers can easily test the request using a web browser
  private void postScore(final Label outputLabel) {
    // Data fields/values to post to the LeaderBoard
    // These fields should be encapsulated in a class
    String gameId = "testgame";
    String userId = "name";
    String score = "8";
    // Do not use String.format to concatenate strings, otherwise the HTML build will fail
    String URL = "https://script.google.com/macros/s/" + 
                 "AKfycby_66cv7hxuwGnRYx2-kZDm4YvlWy0gXiHAgjsO2jSENfWI9OO69mOqjk5goGIEr1rf5Q/exec" +
                 "?action=postScore" +
                 "&gameId=" + gameId +
                 "&userId=" + userId +
                 "&score=" + score;

    Net.HttpRequest httpGET = new Net.HttpRequest(Net.HttpMethods.GET);
    httpGET.setUrl(URL);
    Gdx.net.sendHttpRequest(httpGET, new Net.HttpResponseListener() {
      @Override
      public void handleHttpResponse(Net.HttpResponse httpResponse) {
        outputLabel.setText("Response: " + httpResponse.getResultAsString());
      }

      @Override
      public void failed(Throwable t) {
        outputLabel.setText("postScore failed");
      }

      @Override
      public void cancelled() {
        outputLabel.setText("postScore cancelled");

      }
    });
  }


  @Override
  public void render() {
    ScreenUtils.clear(0, 0, 0, 1);
		stage.act();
		stage.draw();
  }

}
