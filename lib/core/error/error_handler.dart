import 'package:flutter/material.dart';
import 'package:free_log/core/error/app_exception.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:free_log/l10n/app_localizations.dart';

class ErrorHandler {
  static String getMessage(BuildContext context, Object? error) {
    final l10n = AppLocalizations.of(context)!;
    if (error is! AppException) return l10n.unknownError;

    return switch (error.code) {
      ErrorCode.fetchFailed => l10n.fetchFailed,
      ErrorCode.saveFailed => l10n.saveFailed,
      // ErrorCode.authError => l10n.authError,
      ErrorCode.networkError => l10n.checkInternet,
      _ => l10n.unknownError,
    };
  }

  static void showSnackBar(BuildContext context, Object? error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getMessage(context, error))));
  }
}
