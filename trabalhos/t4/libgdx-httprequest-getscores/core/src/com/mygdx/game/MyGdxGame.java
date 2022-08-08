package com.mygdx.game;

import java.util.ArrayList;
import java.util.stream.Collectors;

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
import com.badlogic.gdx.scenes.scene2d.ui.TextArea;
import com.badlogic.gdx.utils.Align;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonReader;
import com.badlogic.gdx.utils.JsonValue;
import com.badlogic.gdx.utils.ScreenUtils;
import com.badlogic.gdx.utils.JsonWriter.OutputType;
import com.badlogic.gdx.utils.viewport.ScreenViewport;


public class MyGdxGame extends ApplicationAdapter {
  private Stage stage;
  private Label outputLabel;
  private Button button;
  private TextArea textArea;

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

    // A text area to show a long string
    textArea = new TextArea("", skin);
		textArea.setSize(col_width*6,row_height*4);
    textArea.setPosition(col_width*3, Gdx.graphics.getHeight()-row_height*7);
    stage.addActor(textArea);

    // A simple button with a text label
		button = new TextButton("Get LeaderBoard", skin, "default");
		button.setSize(col_width*4, row_height);
		button.setPosition(col_width*4, Gdx.graphics.getHeight()-row_height*2);
    button.setColor(0.1f, 0.1f, 0.8f, 1);
		button.addListener(new InputListener(){
      // Called when the button is released
			@Override
			public void touchUp(InputEvent event, float x, float y, int pointer, int button) {
        // Do all the HTTP magic! See further below
        getScores();				
			}
      // Called when the button is pressed
			@Override
			public boolean touchDown(InputEvent event, float x, float y, int pointer, int button) {
        textArea.setText("");
				outputLabel.setText("Getting LeaderBoard...");
				return true;
			}
		});
		stage.addActor(button);

  }

  
  private void getScores() {
    String gameId = "game1"; // Select your game here
    // Do not use String.format to concatenate strings, otherwise the HTML build will fail
    String URL = "https://script.google.com/macros/s/" + 
                 "AKfycby_66cv7hxuwGnRYx2-kZDm4YvlWy0gXiHAgjsO2jSENfWI9OO69mOqjk5goGIEr1rf5Q/exec" +
                 "?action=getScores" +
                 "&gameId=" + gameId;

    Net.HttpRequest httpGET = new Net.HttpRequest(Net.HttpMethods.GET);
    httpGET.setUrl(URL);
    Gdx.net.sendHttpRequest(httpGET, new Net.HttpResponseListener() {

      // Called when a response is received
      @Override
      public void handleHttpResponse(Net.HttpResponse httpResponse) {
        String response = httpResponse.getResultAsString();
        // GDX has its own JSON utilities
        // See more on: https://libgdx.com/wiki/utils/reading-and-writing-json
        Json json = new Json(); 
        // Deserialize a Board object from a JSON string using Java reflection
        // CAUTION when building HTML projects using reflection!
        // See MyGdxGame.gwt.xml and https://libgdx.com/wiki/utils/reflection#gwt
        Board board = json.fromJson(Board.class, response);
        // Concatenate all items in the Board into a single String in the TextArea
        textArea.setText(board.getResponse().stream().map(Object::toString).collect(Collectors.joining("\n")));
        outputLabel.setText("LeaderBoard loaded into the TextArea");
      }

      @Override
      public void failed(Throwable t) {
        outputLabel.setText("getScores failed");
      }

      @Override
      public void cancelled() {
        outputLabel.setText("getScores cancelled");
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
