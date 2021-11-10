package com.freddydev.mypay;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;



public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "freddy.dev/battery";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine){
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessager(), CHANNEL)
            .setMethodCallHandler((call, result) -> {
                // Note: this method id invoked on the main thread.

                if (call.method.equals("getBatteryLevel")) {
                    int batteryLevel = getBatteryLevel();

                    if (batteryLevel != -1) {
                        result.success(batteryLevel);
                    } else {
                         result.error("UNAVAILABLE", "Battery level not available.", null);
                    }
                    
                } else {
                    result.notImplemented();
                }
            }
        )
    }

 public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
            if (call.method.equals("getBatteryLevel")) {
                int batteryLevel = getBatteryLevel();

                if (batteryLevel != -1) {
                    result.success(batteryLevel);
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null);
                }
            } else {
                result.notImplemented();
            }
        }

        private int getBatteryLevel() {
            int batteryLevel = -1;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
                batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
            } else {
                Intent intent = new ContextWrapper(getApplicationContext()).
                        registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
                batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                        intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
            }

            return batteryLevel;
        }

}
