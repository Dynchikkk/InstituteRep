package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.application.helpers.AuthLogger
import com.example.application.helpers.DatabaseHelper
import com.example.application.R
import com.example.application.helpers.ThemeManager

class LoginActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private lateinit var etLogin: EditText
    private lateinit var etPassword: EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("LoginActivity", "onCreate")
        ThemeManager.applyTheme(this)
        setContentView(R.layout.activity_login)

        db = DatabaseHelper(this)

        etLogin = findViewById(R.id.etLogin)
        etPassword = findViewById(R.id.etPassword)

        // Восстановление сохранённых значений при повороте
        savedInstanceState?.let {
            etLogin.setText(it.getString("login_saved", ""))
            etPassword.setText(it.getString("password_saved", ""))
        }

        findViewById<Button>(R.id.btnLogin).setOnClickListener {
            val user = db.loginUser(etLogin.text.toString().trim(), etPassword.text.toString())
            if (user != null) {
                AuthLogger.logAuth(this, user.login)

                val intent = Intent(this, MenuActivity::class.java)
                intent.putExtra("currentUserId", user.id)
                startActivity(intent)
            } else {
                Toast.makeText(this, getString(R.string.toast_invalid), Toast.LENGTH_SHORT).show()
            }
        }

        findViewById<Button>(R.id.btnRegister).setOnClickListener {
            startActivity(Intent(this, RegisterActivity::class.java))
        }
    }

    // Жизненный цикл - логирование
    override fun onStart() { super.onStart(); Log.d("LoginActivity", "onStart") }
    override fun onResume() { super.onResume(); Log.d("LoginActivity", "onResume") }
    override fun onPause() { super.onPause(); Log.d("LoginActivity", "onPause") }
    override fun onStop() { super.onStop(); Log.d("LoginActivity", "onStop") }
    override fun onRestart() { super.onRestart(); Log.d("LoginActivity", "onRestart") }
    override fun onDestroy() { super.onDestroy(); Log.d("LoginActivity", "onDestroy") }

    // Сохранение состояния при повороте экрана
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("login_saved", etLogin.text.toString())
        outState.putString("password_saved", etPassword.text.toString())
    }
}