package com.example.poc_native_communication;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example.poc_native_communication/login";
    private static final int LOGIN_REQUEST_CODE = 1;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("showLogin")) {
                                Log.d("MainActivity", "LoginActivity started");
                                Intent intent = new Intent(this, LoginActivity.class);
                                startActivityForResult(intent, LOGIN_REQUEST_CODE);
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Log.d("MainActivity", "LoginActivity finished, userData: " + data);

        if (requestCode == LOGIN_REQUEST_CODE && resultCode == RESULT_OK) {
            String userData = data.getStringExtra("userData");
            new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL)
                    .invokeMethod("loginSuccess", userData);
        }
    }

}
