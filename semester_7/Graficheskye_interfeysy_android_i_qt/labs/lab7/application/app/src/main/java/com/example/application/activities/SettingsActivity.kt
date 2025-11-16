package com.example.application.activities

import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import com.example.application.helpers.ThemeManager
import com.example.application.ui.SettingsScreen

class SettingsActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            SettingsScreen(
                onToggleTheme = {
                    ThemeManager.toggleTheme(this)
                    recreate()
                }
            )
        }
    }
}
