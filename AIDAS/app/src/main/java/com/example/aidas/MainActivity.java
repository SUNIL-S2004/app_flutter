package com.example.aidas;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;
import com.google.android.material.textfield.TextInputEditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize the login button
        Button loginButton = findViewById(R.id.button);
        TextInputEditText username1 = findViewById(R.id.username1);

        // Set the text color for hint1EditText and hint2EditText
        username1.setTextColor(Color.WHITE);
    }

    // Method to handle the Sign In button click
    public void signIn(View view) {
        // Start the MenuActivity
        Intent intent = new Intent(this, MenuActivity.class);
        startActivity(intent);
    }
}

