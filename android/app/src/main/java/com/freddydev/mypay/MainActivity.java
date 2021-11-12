package com.freddydev.mypay;

import android.Manifest;
import android.os.Build;
import android.app.Activity;
import android.content.Context;
import android.annotation.SuppressLint;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;

import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;
import java.util.ArrayList;

public class MainActivity extends FlutterActivity {
  private static final String channel = "native_code";

  private Result result;
  private Activity activity;
  private Context applicationContext;
  private TelephonyManager telephonyManager;


  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
  super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), channel)
        .setMethodCallHandler(
          (call, result) -> {
            // Note: this method is invoked on the main thread.
            this.result = result;

            switch (call.method) {
              case "getMobileNumber":
                String mobileNumber = getMobileNumber().toString();
                result.success(MobileNumber);
                break;
              case "getTest":
              result.success("Hello from java code!")
                break;
              default:
              result.notImplemented();
            }
          }
        );
  }


  @SuppressLint("HardwareIds")
  private void getMobileNumber() {
    if (!checkPermission()) {
      requestPermission();
    }

    JSONArray simJsonArray = new JSONArray();

    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP_MR1) {
      for (SubscriptionInfo subscriptionInfo : getSubscriptions()) {
        SimCard simCard = new SimCard(telephonyManager, subscriptionInfo);
        simJsonArray.put(simCard.toJSON());
      }
    }

    if (simJsonArray.length() == 0) {
      SimCard simCard = getSingleSimCard();
      if (simCard != null) {
        simJsonArray.put(simCard.toJSON());
      }
    }

    if (simJsonArray.toString().isEmpty()) {
      Log.d("UNAVAILABLE", "No phone number on sim card#3");
      result.error("UNAVAILABLE", "No phone number on sim card", null);
    }

    return simJsonArray;
  }

  @SuppressLint("HardwareIds")
  SimCard getSingleSimCard() {
    if(telephonyManager.getLine1Number() == null || telephonyManager.getLine1Number().isEmpty()){
      Log.e("UNAVAILABLE", "No phone number on sim card#2", null);
      return null;
    }

    return new SimCard(telephonyManager);
  }

  @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP_MR1)
  List<SubscriptionInfo> getSubscriptions() {
    SubscriptionManager subscriptionManager = (SubscriptionManager) this.applicationContext
      .getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE);

    if(subscriptionManager == null){
      Log.e("UNAVAILABLE", "No phone number on sim card#1", null);
      return new ArrayList<>();
    }

    return subscriptionManager.getActiveSubscriptionInfoList();
  }

  private void requestPermission() {
    String str = MY_PERMISSIONS_REQUEST_READ_PHONE_STATE;

    if(android.os.Build.VERSION.SDK_INT > Build.VERSION_CODES.Q){
      String[] perm = {Manifest.permission.READ_PHONE_NUMBERS};
      ActivityCompat.requestPermissions(this.activity, perm, str);
    } else {
      String[] perm = {Manifest.permission.READ_PHONE_STATE};
      ActivityCompat.requestPermissions(this.activity, perm, str);
    }
  }

  private boolean checkPermission() {
    if(android.os.Build.VERSION.SDK_INT > Build.VERSION_CODES.Q){
      return PackageManager.PERMISSION_GRANTED == ContextCompat
        .checkSelfPermission(this.applicationContext, Manifest.permission.READ_PHONE_NUMBERS);
    } else {
      return PackageManager.PERMISSION_GRANTED == ContextCompat
        .checkSelfPermission(this.applicationContext, Manifest.permission.READ_PHONE_STATE);
    }
  }

  private int runUssd() {
    //
  }

}
