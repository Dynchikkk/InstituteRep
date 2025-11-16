package com.example.application.ui

import android.graphics.Bitmap
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.application.R

@Composable
fun ProfileScreen(
    avatar: Bitmap?,
    name: String,
    email: String,
    login: String,
    canTakePhoto: Boolean,
    canMakeAdmin: Boolean,
    onTakePhoto: () -> Unit,
    onMakeAdmin: () -> Unit
) {
    Column(
        modifier = Modifier
            .verticalScroll(rememberScrollState())
            .padding(24.dp)
            .fillMaxSize()
    ) {
        if (avatar != null) {
            Image(
                bitmap = avatar.asImageBitmap(),
                contentDescription = null,
                modifier = Modifier.size(120.dp)
            )
        }

        if (canTakePhoto) {
            Button(onClick = onTakePhoto, modifier = Modifier.fillMaxWidth()) {
                Text("Сделать фото")
            }
        }

        Text("Имя: $name", fontSize = 18.sp)
        Text("Email: $email")
        Text("Логин: $login")

        if (canMakeAdmin) {
            Button(onClick = onMakeAdmin, modifier = Modifier.fillMaxWidth()) {
                Text("Сделать администратором")
            }
        }
    }
}
