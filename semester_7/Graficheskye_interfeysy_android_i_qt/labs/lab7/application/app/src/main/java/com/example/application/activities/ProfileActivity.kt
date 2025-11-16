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
import com.example.application.ui.ProfileScreen

class ProfileActivity : AppCompatActivity() {

    private lateinit var db: DatabaseHelper
    private var profileUserId: Int = -1
    private var currentUserId: Int = -1
    private val REQ_PHOTO = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        db = DatabaseHelper(this)
        profileUserId = intent.getIntExtra("userId", -1)
        currentUserId = intent.getIntExtra("currentUserId", -1)

        db.getUserByIdAsync(lifecycleScope, profileUserId) { profileUser ->
            db.getUserByIdAsync(lifecycleScope, currentUserId) { currentUser ->

                val avatar = db.decodeAvatar(profileUser?.avatar)

                setContent {
                    ProfileScreen(
                        avatar = avatar,
                        name = profileUser?.name ?: "",
                        email = profileUser?.email ?: "",
                        login = profileUser?.login ?: "",
                        canTakePhoto = currentUserId == profileUserId,
                        canMakeAdmin = currentUser?.isAdmin == 1 && profileUser?.isAdmin == 0 && profileUser?.id != currentUser?.id,
                        onTakePhoto = {
                            val intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
                            if (intent.resolveActivity(packageManager) != null) {
                                startActivityForResult(intent, REQ_PHOTO)
                            } else {
                                Toast.makeText(this, "Камера недоступна", Toast.LENGTH_SHORT).show()
                            }
                        },
                        onMakeAdmin = {
                            profileUser?.let {
                                db.makeAdminAsync(lifecycleScope, it.id) {
                                    Toast.makeText(this, "Теперь администратор", Toast.LENGTH_SHORT).show()
                                }
                            }
                        }
                    )
                }
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQ_PHOTO && resultCode == Activity.RESULT_OK) {
            val bitmap = data?.extras?.get("data") as Bitmap
            db.updateUserAvatarAsync(lifecycleScope, currentUserId, bitmap) {}
            recreate()
        }
    }
}
