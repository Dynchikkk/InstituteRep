package com.example.application.ui

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun GameScreen(
    result: String,
    onRock: () -> Unit,
    onPaper: () -> Unit,
    onScissors: () -> Unit,
    onBack: () -> Unit
) {
    Column(
        modifier = Modifier
            .padding(24.dp)
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(result, fontSize = 18.sp)

        Spacer(Modifier.height(24.dp))

        Button(onClick = onRock, modifier = Modifier.fillMaxWidth()) { Text("Камень") }
        Button(onClick = onScissors, modifier = Modifier.fillMaxWidth()) { Text("Ножницы") }
        Button(onClick = onPaper, modifier = Modifier.fillMaxWidth()) { Text("Бумага") }

        Button(onClick = onBack, modifier = Modifier.fillMaxWidth()) { Text("Назад") }
    }
}
