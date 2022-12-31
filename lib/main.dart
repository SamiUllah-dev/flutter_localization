import 'package:flutter/material.dart';
import 'package:flutter_localization_app/localization/constants.dart';
import 'package:flutter_localization_app/localization/supported_languages_list.dart';
import 'package:flutter_localization_app/models/language.dart';
import 'package:flutter_localization_app/screens/registeration_screen.dart';
import '../l10n/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = const Locale('en', '');

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localization',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: MyHomePage(setLocale: setLocale),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function(Locale) setLocale;
  const MyHomePage({super.key, required this.setLocale});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Language? dropdownvalue;

  setLanguage(Language language) {
    setState(() {
      dropdownvalue = language;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      Language language = languages
          .firstWhere((language) => language.code == locale.languageCode);
      setLanguage(language);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).localization),
        actions: [
          DropdownButton<Language>(
            value: dropdownvalue,
            icon: const Icon(Icons.language),
            items: languages
                .map((language) => DropdownMenuItem<Language>(
                    value: language,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(language.flag),
                      const SizedBox(
                        width: 06,
                      ),
                      Text(language.name),
                    ])))
                .toList(),
            onChanged: (language) {
              setLocale(language!.code);
              widget.setLocale(Locale(language.code, ''));
              setState(() {
                dropdownvalue = language;
              });
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const RegisterationScreen(),
    );
  }
}
