package com.example.application.ui

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun AdminScreen(
    users: List<String>,
    onUserClick: (Int) -> Unit,
    onShowLog: () -> Unit
) {
    Column(modifier = Modifier.padding(16.dp).fillMaxSize()) {
        LazyColumn(modifier = Modifier.weight(1f)) {
            itemsIndexed(users) { index, user ->
                Text(
                    user,
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onUserClick(index) }
                        .padding(12.dp)
                )
            }
        }

        Button(onClick = onShowLog, modifier = Modifier.fillMaxWidth()) {
            Text("Показать логи")
        }
    }
}
