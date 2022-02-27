import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String suffixText;
  const SearchBox({
    Key? key,
    required this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 24,
        ),
        hintText: 'Search ' + suffixText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 14,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
          gapPadding: 0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
          gapPadding: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
          gapPadding: 0,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
          gapPadding: 0,
        ),
        errorStyle: const TextStyle(color: Colors.red),
      ),
    );
  }
}
