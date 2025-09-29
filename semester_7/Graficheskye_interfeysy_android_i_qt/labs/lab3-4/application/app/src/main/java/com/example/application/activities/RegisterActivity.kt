package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.application.helpers.DatabaseHelper
import com.example.application.R

class RegisterActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private lateinit var etName: EditText
    private lateinit var etEmail: EditText
    private lateinit var etLogin: EditText
    private lateinit var etPassword: EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("RegisterActivity", "onCreate")
        setContentView(R.layout.activity_register)

        db = DatabaseHelper(this)

        etName = findViewById(R.id.etName)
        etEmail = findViewById(R.id.etEmail)
        etLogin = findViewById(R.id.etLoginReg)
        etPassword = findViewById(R.id.etPasswordReg)

        // Восстановление заполненных полей при повороте
        savedInstanceState?.let {
            etName.setText(it.getString("name_saved", ""))
            etEmail.setText(it.getString("email_saved", ""))
            etLogin.setText(it.getString("login_saved", ""))
            etPassword.setText(it.getString("password_saved", ""))
        }

        findViewById<Button>(R.id.btnSave).setOnClickListener {
            val name = etName.text.toString().trim()
            val email = etEmail.text.toString().trim()
            val login = etLogin.text.toString().trim()
            val password = etPassword.text.toString()
            if (name.isEmpty() || login.isEmpty() || password.isEmpty()) {
                Toast.makeText(this, getString(R.string.toast_reg_err), Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }
            val id = db.registerUser(name, email, login, password)
            if (id > 0) {
                Toast.makeText(this, getString(R.string.toast_reg_ok), Toast.LENGTH_SHORT).show()
                startActivity(Intent(this, LoginActivity::class.java))
                finish()
            } else {
                Toast.makeText(this, getString(R.string.toast_reg_err), Toast.LENGTH_SHORT).show()
            }
        }
    }

    // Жизненный цикл - логирование
    override fun onStart() { super.onStart(); Log.d("RegisterActivity", "onStart") }
    override fun onResume() { super.onResume(); Log.d("RegisterActivity", "onResume") }
    override fun onPause() { super.onPause(); Log.d("RegisterActivity", "onPause") }
    override fun onStop() { super.onStop(); Log.d("RegisterActivity", "onStop") }
    override fun onRestart() { super.onRestart(); Log.d("RegisterActivity", "onRestart") }
    override fun onDestroy() { super.onDestroy(); Log.d("RegisterActivity", "onDestroy") }

    // Сохранение состояния
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("name_saved", etName.text.toString())
        outState.putString("email_saved", etEmail.text.toString())
        outState.putString("login_saved", etLogin.text.toString())
        outState.putString("password_saved", etPassword.text.toString())
    }
}