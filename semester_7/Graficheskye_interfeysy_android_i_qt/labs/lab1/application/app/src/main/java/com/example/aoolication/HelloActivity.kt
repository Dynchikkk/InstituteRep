package com.example.aoolication

import android.app.Activity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class HelloActivity : Activity() {
    var _firstButtonCounter = 0;
    var _secondButtonCounter = 0;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_helloact)

        val firstButtonCounterTextView = findViewById<TextView>(R.id.firstButtonCounterTextView)
        val secondButtonCounterTextView = findViewById<TextView>(R.id.secondButtonCounterTextView)

        val firstButton = findViewById<Button>(R.id.firstButton)
        val secondButton = findViewById<Button>(R.id.secondButton)

        firstButton.setOnClickListener {
            _firstButtonCounter++;
            firstButtonCounterTextView.text = _firstButtonCounter.toString();
            updateGlobalCounter();
        }

        secondButton.setOnClickListener {
            _secondButtonCounter++;
            secondButtonCounterTextView.text = _secondButtonCounter.toString();
            updateGlobalCounter();
        }
    }

    fun updateGlobalCounter() {
        findViewById<TextView>(R.id.globalCounterTextView).text =
            (_firstButtonCounter + _secondButtonCounter).toString();
    }
}

