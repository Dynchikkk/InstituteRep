package com.example.application.activities

import android.content.Context
import android.os.Build
import android.os.Bundle
import android.os.VibrationEffect
import android.os.Vibrator
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.application.R
import com.example.application.databinding.ActivityGameBinding

class GameActivity : AppCompatActivity() {

    private lateinit var binding: ActivityGameBinding
    private val choices by lazy {
        listOf(
            getString(R.string.btn_rock),
            getString(R.string.btn_scissors),
            getString(R.string.btn_paper)
        )
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityGameBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.tvResult.text = getString(R.string.msg_choose)

        binding.btnRock.setOnClickListener { play(getString(R.string.btn_rock)) }
        binding.btnScissors.setOnClickListener { play(getString(R.string.btn_scissors)) }
        binding.btnPaper.setOnClickListener { play(getString(R.string.btn_paper)) }
        binding.btnBack.setOnClickListener { finish() }
    }

    private fun play(userChoice: String) {
        val phoneChoice = choices.random()
        val resultText = "Вы: $userChoice\nТелефон: $phoneChoice"

        var result = "";
        if ((userChoice == getString(R.string.btn_rock) && phoneChoice == getString(R.string.btn_scissors)) ||
            (userChoice == getString(R.string.btn_scissors) && phoneChoice == getString(R.string.btn_paper)) ||
            (userChoice == getString(R.string.btn_paper) && phoneChoice == getString(R.string.btn_rock))) {
            result = getString(R.string.msg_win)
            vibratePhone(this, 500)
        } else if (userChoice == phoneChoice) {
            result = getString(R.string.msg_draw)
            vibratePhone(this, 100)
        } else {
            result = getString(R.string.msg_lose)
            vibratePhone(this, 250)
        }

        binding.tvResult.text = "$resultText\n$result"
    }

    fun vibratePhone(context: Context, duration: Long = 200) {
        val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        if (!vibrator.hasVibrator()) return

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE))
        } else {
            @Suppress("DEPRECATION")
            vibrator.vibrate(duration)
        }
    }
}
