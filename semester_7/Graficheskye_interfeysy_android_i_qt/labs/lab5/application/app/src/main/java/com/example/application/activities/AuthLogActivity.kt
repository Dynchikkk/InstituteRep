package com.example.application.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.application.databinding.ActivityAuthLogBinding
import com.example.application.helpers.AuthLogger

class AuthLogActivity : AppCompatActivity() {

    private lateinit var binding: ActivityAuthLogBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAuthLogBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.tvLog.text = AuthLogger.readLog(this)

        binding.btnClear.setOnClickListener {
            AuthLogger.clearLog(this)
            binding.tvLog.text = "Лог пуст"
        }
    }
}
