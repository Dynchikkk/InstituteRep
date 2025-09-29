package com.example.application.activities

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.example.application.R
import com.example.application.helpers.ThemeManager

class SettingsActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_settings)

        val btnTheme = findViewById<Button>(R.id.btnTheme)
        btnTheme.setOnClickListener {
            // Переключаем глобальную тему (SharedPreferences) и воссоздаем activity чтобы применить
            ThemeManager.toggleTheme(this)
            recreate()
        }
    }
}
