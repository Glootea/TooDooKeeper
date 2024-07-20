package com.glootea.toodookeeper


import android.content.Intent
import com.yandex.authsdk.YandexAuthException
import com.yandex.authsdk.YandexAuthLoginOptions
import com.yandex.authsdk.YandexAuthOptions
import com.yandex.authsdk.YandexAuthResult
import com.yandex.authsdk.YandexAuthSdk
import com.yandex.authsdk.YandexAuthToken
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.glootea.toodookeeper/todo"
    private val requestLoginYandex = 1
    private var result: MethodChannel.Result? = null
    private var  yandexSdk: YandexAuthSdk? = null


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            this.result = result
            when(call.method){
                MethodNames.SHARE.methodName -> share(call, result)
                MethodNames.YANDEXLOGIN.methodName ->  yandexLogin()
                else -> unknownMethod(call)
            }
        }
    }

    private fun yandexLogin() {
        yandexSdk = yandexSdk ?: YandexAuthSdk.create(YandexAuthOptions(applicationContext))
        val loginOptions = YandexAuthLoginOptions()
        val intent = yandexSdk?.contract?.createIntent(
            applicationContext, loginOptions
        )
        if(intent != null) {
            startActivityForResult(intent, requestLoginYandex);
        } else {
            result?.error("0", "Intent is null", "");
        }
    }

    private fun share(
        call: MethodCall,
        result: MethodChannel.Result
    ) {
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
    }

private fun unknownMethod(call: MethodCall) {
    result?.error("Not method found", "No method found: ${call.method}", null)
}

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == requestLoginYandex) {
            val sdk = YandexAuthSdk.create(YandexAuthOptions(applicationContext))
            handleResult(sdk.contract.parseResult(resultCode, data))
        }
        super.onActivityResult(requestCode, resultCode, data)
    }

    private fun handleResult(result: YandexAuthResult) {
        when (result) {
            is YandexAuthResult.Success -> onSuccessAuth(result.token)
            is YandexAuthResult.Failure -> onProcessError(result.exception)
            is YandexAuthResult.Cancelled -> onCancelled()
        }
    }

    private fun onSuccessAuth(token: YandexAuthToken) {
        val res = mapOf(
            "success" to true,
            "token" to token.value,
            "expiresIn" to token.expiresIn,
        )
        result?.success(res)
    }

    private fun onProcessError(exception: YandexAuthException) {
        val res = mapOf(
            "success" to false,
            "provider" to "yandex",
            "error" to exception.toString()
        )
        result?.success(res)
    }

    private fun onCancelled() {
        if (result !== null) {
            val res = mapOf(
                "success" to false,
                "provider" to "yandex",
                "cancelled" to true
            )
            result?.success(res)
        }
    }
}

enum class MethodNames(val methodName:String) {
    SHARE("share"),
    YANDEXLOGIN("yandexLogin")
}
