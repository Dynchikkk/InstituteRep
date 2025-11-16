package com.example.application.activities

import android.content.Context
import android.os.Build
import android.os.Bundle
import android.os.VibrationEffect
import android.os.Vibrator
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import com.example.application.R
import com.example.application.ui.GameScreen

class GameActivity : AppCompatActivity() {

    private val choices by lazy {
        listOf(
            getString(R.string.btn_rock),
            getString(R.string.btn_scissors),
            getString(R.string.btn_paper)
        )
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            var result by remember { mutableStateOf("Выберите действие") }

            GameScreen(
                result = result,
                onRock = { result = play("Камень") },
                onScissors = { result = play("Ножницы") },
                onPaper = { result = play("Бумага") },
                onBack = { finish() }
            )
        }
    }

    private fun play(userChoice: String): String {
        val phoneChoice = choices.random()
        val resultText = "Вы: $userChoice\nТелефон: $phoneChoice"
        val result = when {
            (userChoice == getString(R.string.btn_rock) && phoneChoice == getString(R.string.btn_scissors)) ||
                    (userChoice == getString(R.string.btn_scissors) && phoneChoice == getString(R.string.btn_paper)) ||
                    (userChoice == getString(R.string.btn_paper) && phoneChoice == getString(R.string.btn_rock)) -> {
                vibratePhone(500); getString(R.string.msg_win)
            }
            userChoice == phoneChoice -> {
                vibratePhone(100); getString(R.string.msg_draw)
            }
            else -> {
                vibratePhone(250); getString(R.string.msg_lose)
            }
        }
        return "$resultText\n$result"
    }

    private fun vibratePhone(duration: Long) {
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        if (!vibrator.hasVibrator()) return
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE))
        } else {
            @Suppress("DEPRECATION")
            vibrator.vibrate(duration)
        }
    }
}
