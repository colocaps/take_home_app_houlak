import 'package:core/src/abstractions/custom_top_snackbar_manager.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomTopSnackBarManagerImpl implements CustomTopSnackBarManager {
  @override
  showSuccessTopSnackbar({
    dynamic context,
    dynamic message,
  }) {
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  @override
  showErrorTopSnackbar({
    dynamic context,
    dynamic message,
  }) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  @override
  showInfoTopSnackbar({
    dynamic context,
    dynamic message,
  }) {
    return showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}
