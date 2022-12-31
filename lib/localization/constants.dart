import 'package:flutter/material.dart';
import 'package:flutter_localization_app/l10n/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String languageCode = 'language-code';
AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}

const String english = 'en';
const String urdu = 'ur';
const String hindi = 'hi';

Future<void> setLocale(String lc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(languageCode, lc);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String lc = prefs.getString(languageCode) ?? english;
  return Locale(lc, '');
}
