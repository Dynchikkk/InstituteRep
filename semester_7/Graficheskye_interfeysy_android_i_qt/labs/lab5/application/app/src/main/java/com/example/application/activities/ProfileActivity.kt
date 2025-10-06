package com.example.application.activities

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.databinding.ActivityProfileBinding
import com.example.application.helpers.DatabaseHelper

class ProfileActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private lateinit var binding: ActivityProfileBinding
    private var profileUserId: Int = -1
    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)

        db = DatabaseHelper(this)
        profileUserId = intent.getIntExtra("userId", -1)
        currentUserId = intent.getIntExtra("currentUserId", -1)

        db.getUserByIdAsync(lifecycleScope, profileUserId) { profileUser ->
            db.getUserByIdAsync(lifecycleScope, currentUserId) { currentUser ->

                profileUser?.let {
                    binding.tvName.text = "Имя: ${it.name}"
                    binding.tvEmail.text = "Email: ${it.email}"
                    binding.tvLogin.text = "Логин: ${it.login}"
                }

                if (currentUser != null && currentUser.isAdmin == 1 &&
                    profileUser != null && profileUser.isAdmin == 0 &&
                    profileUser.id != currentUser.id
                ) {
                    binding.btnMakeAdmin.visibility = View.VISIBLE
                    binding.btnMakeAdmin.setOnClickListener {
                        db.makeAdminAsync(lifecycleScope, profileUser.id) {
                            Toast.makeText(this, "Пользователь теперь администратор", Toast.LENGTH_SHORT).show()
                            binding.btnMakeAdmin.visibility = View.GONE
                        }
                    }
                } else {
                    binding.btnMakeAdmin.visibility = View.GONE
                }
            }
        }
    }
}
