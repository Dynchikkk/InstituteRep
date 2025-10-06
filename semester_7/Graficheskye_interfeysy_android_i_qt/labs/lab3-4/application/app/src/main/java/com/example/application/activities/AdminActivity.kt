package com.example.application.activities

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.ListView
import com.example.application.helpers.DatabaseHelper
import com.example.application.R

class AdminActivity : Activity() {
    private lateinit var db: DatabaseHelper

    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_admin)

        currentUserId = intent.getIntExtra("currentUserId", -1)

        db = DatabaseHelper(this)
        val users = db.getAllUsers()
        val listView = findViewById<ListView>(R.id.lvUsers)

        // Подключаем список пользователей
        val adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1,
            users.map { "${it.name} (${if (it.isAdmin == 1) "Admin" else "User"})" })
        listView.adapter = adapter

        // При клике на пользователя открываем его профиль
        listView.setOnItemClickListener { _, _, position, _ ->
            val intent = Intent(this, ProfileActivity::class.java)
            intent.putExtra("userId", users[position].id)
            intent.putExtra("currentUserId", currentUserId)
            startActivity(intent)
        }

        // Навешиваем обработчик на кнопку из layout
        findViewById<Button>(R.id.btnShowLog).setOnClickListener {
            startActivity(Intent(this, AuthLogActivity::class.java))
        }
    }
}