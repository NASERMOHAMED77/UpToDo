// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            hintText: 'Search',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
