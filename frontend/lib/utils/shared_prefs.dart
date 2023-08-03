import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends ChangeNotifier {
  // Automatic login and logout with shared preferences
  Future<void> setAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("IS_USER_LOGGED_IN", true);
  }

  Future<void> clearAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // if (prefs.containsKey('IS_USER_LOGGED_IN')) {
    await prefs.remove("IS_USER_LOGGED_IN");
    // }
  }

  Future<bool> getAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? status = prefs.getBool('IS_USER_LOGGED_IN');
    return status != null;
  }

  // onboarding
  Future<void> setOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("IS_ONBOARDING_COMPLETE", true);
  }

  Future<bool> getOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? status = prefs.getBool('IS_ONBOARDING_COMPLETE');
    return status != null;
  }
}
