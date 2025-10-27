package com.example.application.activities

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.os.Bundle
import android.provider.MediaStore
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.application.R
import com.example.application.databinding.ActivityProfileBinding
import com.example.application.helpers.DatabaseHelper

class ProfileActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private lateinit var binding: ActivityProfileBinding
    private var profileUserId: Int = -1
    private var currentUserId: Int = -1
    private val REQUEST_IMAGE_CAPTURE = 1

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
                    binding.tvName.text = getString(R.string.hint_name) + ": ${it.name}"
                    binding.tvEmail.text = getString(R.string.hint_email) + ": ${it.email}"
                    binding.tvLogin.text = getString(R.string.hint_login) + ": ${it.login}"

                    // показываем аватар, если он есть
                    val bitmap = db.decodeAvatar(it.avatar)
                    if (bitmap != null) {
                        binding.imgAvatar.setImageBitmap(bitmap)
                    }
                }

                // показать кнопку "Сделать админом"
                if (currentUser != null && currentUser.isAdmin == 1 &&
                    profileUser != null && profileUser.isAdmin == 0 &&
                    profileUser.id != currentUser.id
                ) {
                    binding.btnMakeAdmin.visibility = View.VISIBLE
                    binding.btnMakeAdmin.setOnClickListener {
                        db.makeAdminAsync(lifecycleScope, profileUser.id) {
                            Toast.makeText(this, getString(R.string.msg_now_admin), Toast.LENGTH_SHORT).show()
                            binding.btnMakeAdmin.visibility = View.GONE
                        }
                    }
                } else {
                    binding.btnMakeAdmin.visibility = View.GONE
                }

                // Если это свой профиль — можно менять фото
                if (currentUserId == profileUserId) {
                    binding.btnTakePhoto.visibility = View.VISIBLE
                    binding.btnTakePhoto.setOnClickListener {
                        val takePictureIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
                        if (takePictureIntent.resolveActivity(packageManager) != null) {
                            startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE)
                        } else {
                            Toast.makeText(this, getString(R.string.msg_camera_unavailable), Toast.LENGTH_SHORT).show()
                        }
                    }
                } else {
                    binding.btnTakePhoto.visibility = View.GONE
                }
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == Activity.RESULT_OK) {
            val imageBitmap = data?.extras?.get("data") as Bitmap
            binding.imgAvatar.setImageBitmap(imageBitmap)

            if (profileUserId == currentUserId) {
                db.updateUserAvatarAsync(lifecycleScope, currentUserId, imageBitmap) {
                }
            }
        }
    }
}
