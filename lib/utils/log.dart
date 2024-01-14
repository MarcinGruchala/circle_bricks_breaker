import 'package:flutter/foundation.dart';

/// Logs a message to the console if the app is running in debug mode.
void log(String message) {
  if (kDebugMode) {
    print(message);
  }
}
