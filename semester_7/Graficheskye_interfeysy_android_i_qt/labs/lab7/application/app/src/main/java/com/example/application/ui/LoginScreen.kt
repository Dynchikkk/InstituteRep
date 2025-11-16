package com.example.application.ui

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import com.example.application.R

@Composable
fun LoginScreen(
    onLogin: (String, String) -> Unit,
    onRegister: () -> Unit
) {
    var login by remember { mutableStateOf("") }
    var pass by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .padding(24.dp)
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        OutlinedTextField(
            value = login,
            onValueChange = { login = it },
            label = { Text("Логин") },
            modifier = Modifier.fillMaxWidth()
        )

        OutlinedTextField(
            value = pass,
            onValueChange = { pass = it },
            label = { Text("Пароль") },
            modifier = Modifier.fillMaxWidth(),
            visualTransformation = PasswordVisualTransformation()
        )

        Spacer(Modifier.height(16.dp))

        Button(onClick = { onLogin(login, pass) }, modifier = Modifier.fillMaxWidth()) {
            Text("Войти")
        }

        Button(onClick = onRegister, modifier = Modifier.fillMaxWidth()) {
            Text("Регистрация")
        }
    }
}
