package com.example.application.activities

import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import com.example.application.helpers.AuthLogger
import com.example.application.ui.AuthLogScreen

class AuthLogActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val logText = AuthLogger.readLog(this)

        setContent {
            AuthLogScreen(
                text = logText,
                onClear = {
                    AuthLogger.clearLog(this)
                    recreate()
                }
            )
        }
    }
}
