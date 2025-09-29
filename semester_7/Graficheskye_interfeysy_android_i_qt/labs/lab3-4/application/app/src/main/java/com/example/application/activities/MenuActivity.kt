package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.example.application.helpers.DatabaseHelper
import com.example.application.R

class MenuActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_menu)

        db = DatabaseHelper(this)
        currentUserId = intent.getIntExtra("currentUserId", -1)

        val btnProfile = findViewById<Button>(R.id.btnProfile)
        val btnSettings = findViewById<Button>(R.id.btnSettings)
        val btnAdmin = findViewById<Button>(R.id.btnAdmin)
        val btnExit = findViewById<Button>(R.id.btnExit)

        // Показываем кнопку администрирования только если текущий пользователь админ
        val currentUser = db.getUserById(currentUserId)
        if (currentUser != null && currentUser.isAdmin == 1) {
            btnAdmin.visibility = View.VISIBLE
        } else {
            btnAdmin.visibility = View.GONE
        }

        btnProfile.setOnClickListener {
            val intent = Intent(this, ProfileActivity::class.java)
            intent.putExtra("userId", currentUserId)           // показываем профиль текущего пользователя
            intent.putExtra("currentUserId", currentUserId)    // кто текущий (чтобы проверять права)
            startActivity(intent)
        }

        btnSettings.setOnClickListener {
            startActivity(Intent(this, SettingsActivity::class.java))
        }

        btnAdmin.setOnClickListener {
            val intent = Intent(this, AdminActivity::class.java)
            intent.putExtra("currentUserId", currentUserId) // передаём, кто сейчас в системе (чтобы открыть профили и понять права)
            startActivity(intent)
        }

        btnExit.setOnClickListener {
            finish()
        }
    }
}