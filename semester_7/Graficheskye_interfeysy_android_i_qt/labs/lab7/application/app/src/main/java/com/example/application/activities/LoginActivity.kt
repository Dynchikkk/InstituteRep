package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.helpers.AuthLogger
import com.example.application.helpers.DatabaseHelper
import com.example.application.helpers.ThemeManager
import com.example.application.ui.LoginScreen

class LoginActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ThemeManager.applyTheme(this)
        db = DatabaseHelper(this)

        setContent {
            LoginScreen(
                onLogin = { login, password ->
                    db.loginUserAsync(lifecycleScope, login, password) { user ->
                        if (user != null) {
                            AuthLogger.logAuth(this, user.login)
                            startActivity(Intent(this, MenuActivity::class.java).apply {
                                putExtra("currentUserId", user.id)
                            })
                        } else {
                            Toast.makeText(this, "Неверный логин или пароль", Toast.LENGTH_SHORT).show()
                        }
                    }
                },
                onRegister = {
                    startActivity(Intent(this, RegisterActivity::class.java))
                }
            )
        }
    }
}
