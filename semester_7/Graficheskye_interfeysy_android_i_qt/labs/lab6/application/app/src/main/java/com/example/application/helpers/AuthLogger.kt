package com.example.application.helpers

import android.content.Context
import java.io.File
import java.text.SimpleDateFormat
import java.util.*

object AuthLogger {
    private const val FILE_NAME = "auth_log.txt"

    fun logAuth(context: Context, login: String) {
        val timestamp = SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(Date())
        val entry = "$timestamp — Пользователь [$login] вошёл в систему\n"
        val file = File(context.filesDir, FILE_NAME)
        file.appendText(entry)
    }

    fun readLog(context: Context): String {
        val file = File(context.filesDir, FILE_NAME)
        return if (file.exists()) file.readText() else "Лог пуст"
    }

    fun clearLog(context: Context) {
        val file = File(context.filesDir, FILE_NAME)
        if (file.exists()) file.writeText("")
    }
}