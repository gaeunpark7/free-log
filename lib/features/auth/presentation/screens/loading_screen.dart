import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: Responsive.screenPadding(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/splash_icon2.png',
                width: 90,
                height: 90,
              ),
              const SizedBox(height: 2),
              const Text(
                'Freelog',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.loginSubTitle,
                style: AppTextStyles.subTitleBold(
                  context,
                ).copyWith(color: const Color(0xFFA89B89)),
              ),

              const SizedBox(height: 12),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: LinearProgressIndicator(
                  minHeight: 12,
                  backgroundColor: AppColors.primary,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primarySoft,
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
