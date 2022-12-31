import '../models/language.dart';
import 'package:flutter/material.dart';

List<Language> languages = [
  Language(id: '1', name: 'English', flag: '🇺🇸', code: 'en'),
  Language(id: '2', name: 'اردو', flag: '🇵🇰', code: 'ur'),
  Language(id: '3', name: 'हिंदी', flag: '🇮🇳', code: 'hi'),
  // Language(id: '3', name: 'پښتو', flag: '🇦🇫', code: 'pus'),
];

List<Locale> locales = const [
  Locale('en', ''), // English
  Locale('ur', ''), // Urdu
  Locale('hi', ''), // Hindi
  // Locale('pus', ''), // Pashto
];
