package com.example.application.activities

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.os.Bundle
import android.provider.MediaStore
import android.widget.Toast
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.helpers.DatabaseHelper
import com.example.application.ui.RegisterScreen

class RegisterActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private val REQ_PHOTO = 1
    private var avatarBitmap: Bitmap? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        db = DatabaseHelper(this)

        setContent {
            RegisterScreen(
                avatar = avatarBitmap,
                onTakePhoto = {
                    val intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
                    if (intent.resolveActivity(packageManager) != null) {
                        startActivityForResult(intent, REQ_PHOTO)
                    } else {
                        Toast.makeText(this, "Камера недоступна", Toast.LENGTH_SHORT).show()
                    }
                },
                onSave = { name, email, login, password ->
                    if (name.isEmpty() || login.isEmpty() || password.isEmpty()) {
                        Toast.makeText(this, "Заполните обязательные поля", Toast.LENGTH_SHORT).show()
                        return@RegisterScreen
                    }
                    db.registerUserAsync(lifecycleScope, name, email, login, password, avatarBitmap) { id ->
                        if (id > 0) {
                            Toast.makeText(this, "Регистрация успешна", Toast.LENGTH_SHORT).show()
                            startActivity(Intent(this, LoginActivity::class.java))
                            finish()
                        } else {
                            Toast.makeText(this, "Ошибка регистрации", Toast.LENGTH_SHORT).show()
                        }
                    }
                }
            )
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQ_PHOTO && resultCode == Activity.RESULT_OK) {
            avatarBitmap = data?.extras?.get("data") as Bitmap
            recreate()
        }
    }
}
