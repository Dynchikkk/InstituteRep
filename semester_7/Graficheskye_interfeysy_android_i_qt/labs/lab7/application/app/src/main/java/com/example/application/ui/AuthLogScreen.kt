package com.example.application.ui

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun AuthLogScreen(
    text: String,
    onClear: () -> Unit
) {
    Column(modifier = Modifier.padding(16.dp).fillMaxSize()) {
        Text(text, modifier = Modifier.weight(1f))

        Button(onClick = onClear, modifier = Modifier.fillMaxWidth()) {
            Text("Очистить")
        }
    }
}
