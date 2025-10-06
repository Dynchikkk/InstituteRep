package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import android.widget.ArrayAdapter
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.databinding.ActivityAdminBinding
import com.example.application.helpers.DatabaseHelper

class AdminActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private lateinit var binding: ActivityAdminBinding
    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAdminBinding.inflate(layoutInflater)
        setContentView(binding.root)

        currentUserId = intent.getIntExtra("currentUserId", -1)
        db = DatabaseHelper(this)

        db.getAllUsersAsync(lifecycleScope) { users ->
            val adapter = ArrayAdapter(
                this,
                android.R.layout.simple_list_item_1,
                users.map { "${it.name} (${if (it.isAdmin == 1) "Admin" else "User"})" }
            )
            binding.lvUsers.adapter = adapter
            binding.lvUsers.setOnItemClickListener { _, _, position, _ ->
                startActivity(Intent(this, ProfileActivity::class.java).apply {
                    putExtra("userId", users[position].id)
                    putExtra("currentUserId", currentUserId)
                })
            }
        }

        binding.btnShowLog.setOnClickListener {
            startActivity(Intent(this, AuthLogActivity::class.java))
        }
    }
}
