package com.example.application.activities

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.application.helpers.DatabaseHelper
import com.example.application.R

class ProfileActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private var profileUserId: Int = -1
    private var currentUserId: Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_profile)

        db = DatabaseHelper(this)

        profileUserId = intent.getIntExtra("userId", -1)
        currentUserId = intent.getIntExtra("currentUserId", -1)

        val tvName = findViewById<TextView>(R.id.tvName)
        val tvEmail = findViewById<TextView>(R.id.tvEmail)
        val tvLogin = findViewById<TextView>(R.id.tvLogin)
        val btnMakeAdmin = findViewById<Button>(R.id.btnMakeAdmin)

        val profileUser = db.getUserById(profileUserId)
        val currentUser = db.getUserById(currentUserId)

        profileUser?.let {
            tvName.text = "Имя    ${it.name}"
            tvEmail.text = "Email    ${it.email}"
            tvLogin.text = "Логин    ${it.login}"
        }

        if (currentUser != null && currentUser.isAdmin == 1 && profileUser != null && profileUser.id != currentUser.id) {
            btnMakeAdmin.visibility = View.VISIBLE
            btnMakeAdmin.setOnClickListener {
                db.makeAdmin(profileUser.id)
                Toast.makeText(this, getString(R.string.toast_became_admin), Toast.LENGTH_SHORT).show()
                btnMakeAdmin.visibility = View.GONE
            }
        } else {
            btnMakeAdmin.visibility = View.GONE
        }
    }
}