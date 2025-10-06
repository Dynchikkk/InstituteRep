package com.example.application.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.application.databinding.ActivitySettingsBinding
import com.example.application.helpers.ThemeManager

class SettingsActivity : AppCompatActivity() {

    private lateinit var binding: ActivitySettingsBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySettingsBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnTheme.setOnClickListener {
            ThemeManager.toggleTheme(this)
            recreate()
        }
    }
}
