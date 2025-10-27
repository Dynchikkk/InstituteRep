package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.databinding.ActivityMenuBinding
import com.example.application.helpers.DatabaseHelper

class MenuActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private lateinit var binding: ActivityMenuBinding
    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMenuBinding.inflate(layoutInflater)
        setContentView(binding.root)

        db = DatabaseHelper(this)
        currentUserId = intent.getIntExtra("currentUserId", -1)

        db.getUserByIdAsync(lifecycleScope, currentUserId) { currentUser ->
            if (currentUser?.isAdmin == 1) {
                binding.btnAdmin.visibility = View.VISIBLE
            } else {
                binding.btnAdmin.visibility = View.GONE
            }
        }

        binding.btnProfile.setOnClickListener {
            startActivity(Intent(this, ProfileActivity::class.java).apply {
                putExtra("userId", currentUserId)
                putExtra("currentUserId", currentUserId)
            })
        }

        binding.btnSettings.setOnClickListener {
            startActivity(Intent(this, SettingsActivity::class.java))
        }

        binding.btnAdmin.setOnClickListener {
            startActivity(Intent(this, AdminActivity::class.java).apply {
                putExtra("currentUserId", currentUserId)
            })
        }

        // --- Кнопка Старт: запуск GameActivity ---
        binding.btnStartGame.setOnClickListener {
            startActivity(Intent(this, GameActivity::class.java))
        }

        binding.btnExit.setOnClickListener { finish() }
    }
}
