import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/features/home/domain/model/time_entry_model.dart';

class TimeEntryListView extends StatelessWidget {
  final TimeEntryModel entry;
  final String Function(DateTime?) weekdayLabel;
  final String Function(double) formatHours;
  const TimeEntryListView({
    super.key,
    required this.entry,
    required this.weekdayLabel,
    required this.formatHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 237, 248),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.schedule, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entry.workedAt?.toLocal().year}.'
                    '${entry.workedAt?.toLocal().month.toString().padLeft(2, '0')}.'
                    '${entry.workedAt?.toLocal().day.toString().padLeft(2, '0')}',
                    style: AppTextStyles.bodyBold(context),
                  ),
                  Text(weekdayLabel(entry.workedAt), style: AppTextStyles.caption(context)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(TimeUtils.format(entry.minutes), style: AppTextStyles.subTitle(context)),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
