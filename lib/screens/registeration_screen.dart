import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/gen_l10n/app_localizations.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  Future<String?> openCalender(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, //context of current state
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      return DateFormat.yMd('ur').format(pickedDate);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.registrationForm,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.name,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.phoneNumber,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.email,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.address,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _dobController,
                    onTap: () async {
                      String? datetime = await openCalender(context);
                      if (datetime != null) {
                        _dobController.text = datetime;
                      }
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.dateOfBirth,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                minimumSize: const Size(double.infinity, 50)),
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.submit))
      ],
    );
  }
}
