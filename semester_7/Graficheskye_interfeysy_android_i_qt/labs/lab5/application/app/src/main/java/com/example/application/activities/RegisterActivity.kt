package com.example.application.activities

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.databinding.ActivityRegisterBinding
import com.example.application.helpers.DatabaseHelper

class RegisterActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private lateinit var binding: ActivityRegisterBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityRegisterBinding.inflate(layoutInflater)
        setContentView(binding.root)

        db = DatabaseHelper(this)

        binding.btnSave.setOnClickListener {
            val name = binding.etName.text.toString().trim()
            val email = binding.etEmail.text.toString().trim()
            val login = binding.etLoginReg.text.toString().trim()
            val password = binding.etPasswordReg.text.toString()

            if (name.isEmpty() || login.isEmpty() || password.isEmpty()) {
                Toast.makeText(this, "Заполните все поля", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            db.registerUserAsync(lifecycleScope, name, email, login, password) { id ->
                if (id > 0) {
                    Toast.makeText(this, "Регистрация успешна", Toast.LENGTH_SHORT).show()
                    startActivity(Intent(this, LoginActivity::class.java))
                    finish()
                } else {
                    Toast.makeText(this, "Ошибка регистрации", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
}
