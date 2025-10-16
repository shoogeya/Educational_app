package com.tawjihepalestine.app

import android.content.Context
import android.media.AudioManager
import android.view.WindowManager.LayoutParams
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    private var previousVolume: Int = 0

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        window.addFlags(LayoutParams.FLAG_SECURE)

        // Mute audio playback
        muteAudio()

        super.configureFlutterEngine(flutterEngine)
    }

    private fun muteAudio() {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        previousVolume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC)
        audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0)
    }

    private fun unmuteAudio() {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, previousVolume, 0)
    }

    override fun onDestroy() {
        super.onDestroy()
        unmuteAudio() // Ensure to unmute when the activity is destroyed
    }
}
