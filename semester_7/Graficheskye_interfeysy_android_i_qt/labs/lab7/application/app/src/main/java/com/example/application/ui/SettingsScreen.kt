package com.example.application.ui

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun SettingsScreen(onToggleTheme: () -> Unit) {
    Column(
        modifier = Modifier
            .padding(24.dp)
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Button(onClick = onToggleTheme, modifier = Modifier.fillMaxWidth()) {
            Text("Сменить тему")
        }
    }
}
