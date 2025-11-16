package com.example.application.ui

import android.graphics.Bitmap
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import com.example.application.R

@Composable
fun RegisterScreen(
    avatar: Bitmap?,
    onTakePhoto: () -> Unit,
    onSave: (String, String, String, String) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var email by remember { mutableStateOf("") }
    var login by remember { mutableStateOf("") }
    var pass by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .verticalScroll(rememberScrollState())
            .padding(24.dp)
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        if (avatar != null) {
            Image(
                bitmap = avatar.asImageBitmap(),
                contentDescription = null,
                modifier = Modifier.size(120.dp)
            )
        }

        Button(onClick = onTakePhoto, modifier = Modifier.fillMaxWidth()) {
            Text("Сделать фото")
        }

        OutlinedTextField(value = name, onValueChange = { name = it }, label = { Text("Имя") }, modifier = Modifier.fillMaxWidth())
        OutlinedTextField(value = email, onValueChange = { email = it }, label = { Text("Email") }, modifier = Modifier.fillMaxWidth())
        OutlinedTextField(value = login, onValueChange = { login = it }, label = { Text("Логин") }, modifier = Modifier.fillMaxWidth())
        OutlinedTextField(
            value = pass,
            onValueChange = { pass = it },
            label = { Text("Пароль") },
            visualTransformation = PasswordVisualTransformation(),
            modifier = Modifier.fillMaxWidth()
        )

        Button(onClick = { onSave(name, email, login, pass) }, modifier = Modifier.fillMaxWidth()) {
            Text("Сохранить")
        }
    }
}
