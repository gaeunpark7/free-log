import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';
import 'package:intl/intl.dart';

class SettingsCard extends StatefulWidget {
  final UserModel? user;
  final Function(bool) onChanged;
  const SettingsCard({super.key, required this.user, required this.onChanged});

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('기본 설정', style: AppTextStyles.subTitleBold(context)),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.background,
                  child: Icon(Icons.settings_outlined, color: AppColors.textTertiary),
                ),
              ],
            ),
            Divider(color: AppColors.borderDefault),
            SizedBox(height: 8),
            _buildSettingRow(
              context,
              "기본 시급",
              NumberFormat('#,###').format(widget.user?.hourlyRate ?? 0),
            ),
            SizedBox(height: 12),
            _buildSettingRow(
              context,
              "기본 마진율",
              '${((widget.user?.marginRate ?? 0.3) * 100).toInt()}%',
            ),
            _buildDeadLine(context),
          ],
        ),
      ),
    );
  }

  Row _buildDeadLine(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('마감일 알림', style: AppTextStyles.body(context)),
        Transform.scale(
          scaleY: 0.9,
          child: Switch(
            value: widget.user?.notifyDeadline ?? true,
            onChanged: (value) => widget.onChanged(value),
            thumbColor: WidgetStateProperty.all(Colors.white),
            trackColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) return AppColors.primary;
              return AppColors.borderDefault;
            }),
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) return AppColors.primary;
              return AppColors.borderDefault;
            }),
          ),
        ),
      ],
    );
  }

  Row _buildSettingRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.body(context)),
        Text(value, style: AppTextStyles.bodyBold(context)),
      ],
    );
  }
}
