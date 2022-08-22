import 'package:flutter/material.dart';

abstract class CustomTopSnackBarManager {
  void showSuccessTopSnackbar({
    BuildContext context,
    String message,
  });
  void showInfoTopSnackbar({
    BuildContext context,
    String message,
  });
  void showErrorTopSnackbar({
    BuildContext context,
    String message,
  });
}
