package com.example.application.ui

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun MenuScreen(
    isAdmin: Boolean,
    onProfile: () -> Unit,
    onSettings: () -> Unit,
    onAdmin: () -> Unit,
    onStartGame: () -> Unit,
    onExit: () -> Unit
) {
    Column(
        modifier = Modifier
            .padding(24.dp)
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Button(onClick = onProfile, modifier = Modifier.fillMaxWidth()) { Text("Профиль") }
        Button(onClick = onSettings, modifier = Modifier.fillMaxWidth()) { Text("Настройки") }
        Button(onClick = onStartGame, modifier = Modifier.fillMaxWidth()) { Text("Играть") }

        if (isAdmin) {
            Button(onClick = onAdmin, modifier = Modifier.fillMaxWidth()) { Text("Админ-панель") }
        }

        Button(onClick = onExit, modifier = Modifier.fillMaxWidth()) { Text("Выход") }
    }
}
