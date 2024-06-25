package com.glootea.toodookeeper

import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.glootea.toodookeeper/todo"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if(call.method == "share") {
                try {
                    val text = call.argument<Map<String, String>>("text").toString()
                    val sendIntent: Intent = Intent().apply {
                        action = Intent.ACTION_SEND
                        putExtra(Intent.EXTRA_TEXT, text)
                        type = "text/plain"
                    }

                    val shareIntent = Intent.createChooser(sendIntent, null)
                    startActivity(shareIntent)
                     result.success(null)
                } catch (e: Exception) {
                    result.error(e.message ?: "Share exception", e.localizedMessage, e.stackTrace)
                }

            } else {
                result.error("Not method found", "No method found: ${call.method}", null)   
            }
        }
    }
}
