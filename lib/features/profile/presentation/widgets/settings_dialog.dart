import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/core/widgets/text_field/margin_rate_field.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';
import 'package:free_log/features/profile/presentation/providers/profile_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';

class SettingsDialog extends ConsumerStatefulWidget {
  final UserModel user;
  const SettingsDialog({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  late TextEditingController _hourlyRateController;
  late TextEditingController _marginController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _hourlyRateController = TextEditingController(text: widget.user.hourlyRate.toString());
    _marginController = TextEditingController(
      text: (widget.user.marginRate * 100).toInt().toString(),
    );
  }

  @override
  void dispose() {
    _hourlyRateController.dispose();
    _marginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              SizedBox(height: 12),
              //기본 시급
              Text(
                AppLocalizations.of(context)!.defaultHourlyRate,
                style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
              ),
              SizedBox(height: 2),
              HourlyRateField(
                controller: _hourlyRateController,
                hintText: AppLocalizations.of(context)!.hourlyRateHint,
                errorText: AppLocalizations.of(context)!.hourlyRateError,
                maxDigits: 8,
              ),
              SizedBox(height: 12),

              //마진율
              Text(
                AppLocalizations.of(context)!.defaultMargin,
                style: AppTextStyles.captionBold(context).copyWith(color: AppColors.textPrimary),
              ),
              SizedBox(height: 2),
              MarginRateField(controller: _marginController),
              SizedBox(height: 12),

              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildButton() {
    return Row(
      children: [
        Expanded(
          child: AppFilledButton.cancel(
            text: AppLocalizations.of(context)!.cancel,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: AppFilledButton(
            onPressed: () {
              final hourlyRate = int.tryParse(_hourlyRateController.text.replaceAll(',', '')) ?? 0;
              final marginRatePercent = int.tryParse(_marginController.text.trim()) ?? 30;
              final noChange =
                  hourlyRate == widget.user.hourlyRate &&
                  marginRatePercent == (widget.user.marginRate * 100).toInt();
              if (noChange) {
                Navigator.pop(context);
                return;
              }

              final marginRate = marginRatePercent / 100;
              if (!_formKey.currentState!.validate()) return;
              ref
                  .read(profileProvider.notifier)
                  .updateProfile(hourlyRate: hourlyRate, marginRate: marginRate);
              Navigator.pop(context);
            },
            text: AppLocalizations.of(context)!.save,
          ),
        ),
      ],
    );
  }

  Row _buildTitle(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.settings_outlined, color: AppColors.primary),
        ),
        SizedBox(width: 10),
        Text(
          AppLocalizations.of(context)!.editSettings,
          style: AppTextStyles.subTitleBold(context),
        ),
      ],
    );
  }
}
