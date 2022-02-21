import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton(
      {Key? key, this.onChanged, this.nameFiled, required this.hint})
      : super(key: key);

  final Function(String?)? onChanged;

  final String? nameFiled;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        hint,
        style: const TextStyle(color: Colors.white),
      ),
      value: nameFiled,
      items: [
        "Egypt",
        "Afghanistan",
        "Armenia",
        "Azerbaijan",
        "Bahrain",
        "Bangladesh",
        "Bhutan",
        "Brunei",
        "Cambodia",
        "China",
        "Cyprus",
        "Georgia",
        "Hong Kong",
        "India",
        "Indonesia",
        "Iran",
        "Iraq",
        "Japan",
        "Jordan",
        "Kazakhstan",
        "Kuwait",
        "Kyrgyzstan",
        "Lao People's Democratic Republic",
        "Lebanon",
        "Macao",
        "Malaysia",
        "Maldives",
        "Mongolia",
        "Myanmar",
        "Nepal",
        "Oman",
        "Pakistan",
        "Palestine",
        "Philippines",
        "Qatar",
        "S. Korea",
        "Saudi Arabia",
        "Singapore",
        "Sri Lanka",
        "Syrian Arab Republic",
        "Taiwan",
        "Tajikistan",
        "Thailand",
        "Timor-Leste",
        "Turkey",
        "UAE",
        "Uzbekistan",
        "Vietnam",
        "Yemen"
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}
