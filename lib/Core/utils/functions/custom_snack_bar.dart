import 'package:flutter/material.dart';

SnackBar customSnackBar(String errMessage) {
  return SnackBar(
    content: Text(
      errMessage,
      style: const TextStyle(),
    ),
    duration: const Duration(seconds: 3),
  );
}
