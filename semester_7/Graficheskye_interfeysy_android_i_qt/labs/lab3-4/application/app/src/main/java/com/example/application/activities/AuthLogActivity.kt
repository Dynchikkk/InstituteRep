package com.example.application.activities

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.application.helpers.AuthLogger
import com.example.application.R

class AuthLogActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_auth_log)

        val tvLog = findViewById<TextView>(R.id.tvLog)
        tvLog.text = AuthLogger.readLog(this)

        findViewById<Button>(R.id.btnClear).setOnClickListener {
            AuthLogger.clearLog(this)
            tvLog.text = "Лог пуст"
        }
    }
}