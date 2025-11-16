package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.helpers.DatabaseHelper
import com.example.application.ui.MenuScreen

class MenuActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        db = DatabaseHelper(this)
        currentUserId = intent.getIntExtra("currentUserId", -1)

        db.getUserByIdAsync(lifecycleScope, currentUserId) { currentUser ->
            val isAdmin = currentUser?.isAdmin == 1

            setContent {
                MenuScreen(
                    isAdmin = isAdmin,
                    onProfile = {
                        startActivity(Intent(this, ProfileActivity::class.java).apply {
                            putExtra("userId", currentUserId)
                            putExtra("currentUserId", currentUserId)
                        })
                    },
                    onSettings = { startActivity(Intent(this, SettingsActivity::class.java)) },
                    onAdmin = { startActivity(Intent(this, AdminActivity::class.java).apply {
                        putExtra("currentUserId", currentUserId)
                    }) },
                    onStartGame = { startActivity(Intent(this, GameActivity::class.java)) },
                    onExit = { finish() }
                )
            }
        }
    }
}
