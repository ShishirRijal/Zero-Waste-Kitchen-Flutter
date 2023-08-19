import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends ChangeNotifier {
  static const isUserLoggedIn = 'IS_USER_LOGGED_IN';
  static const isOnboardingCompleted = 'IS_ONBOARDING_COMPLETE';

  // Automatic login and logout with shared preferences
  Future<void> setAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isUserLoggedIn, true);

    notifyListeners();
  }

  Future<void> clearAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(isUserLoggedIn)) {
      await prefs.remove(isUserLoggedIn);
    }
    notifyListeners();
  }

  Future<bool> getAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? status = prefs.getBool(isUserLoggedIn);
    return status != null;
  }

  // onboarding
  static Future<void> setOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isOnboardingCompleted, true);
  }

  Future<bool> getOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? status = prefs.getBool(isOnboardingCompleted);
    return status != null;
  }

  static Future<void> clearOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(isOnboardingCompleted);
  }
}
