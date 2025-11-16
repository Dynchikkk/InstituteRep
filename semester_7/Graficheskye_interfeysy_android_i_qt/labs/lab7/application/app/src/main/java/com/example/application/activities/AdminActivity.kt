package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.helpers.DatabaseHelper
import com.example.application.ui.AdminScreen

class AdminActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        currentUserId = intent.getIntExtra("currentUserId", -1)
        db = DatabaseHelper(this)

        db.getAllUsersAsync(lifecycleScope) { users ->
            val userNames = users.map { "${it.name} (${if (it.isAdmin == 1) "Admin" else "User"})" }
            setContent {
                AdminScreen(
                    users = userNames,
                    onUserClick = { index ->
                        startActivity(Intent(this, ProfileActivity::class.java).apply {
                            putExtra("userId", users[index].id)
                            putExtra("currentUserId", currentUserId)
                        })
                    },
                    onShowLog = {
                        startActivity(Intent(this, AuthLogActivity::class.java))
                    }
                )
            }
        }
    }
}
