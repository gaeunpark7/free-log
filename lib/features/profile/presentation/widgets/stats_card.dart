import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/utils/time_utils.dart';
import 'package:free_log/features/profile/presentation/providers/profile_stats_provider.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class StatsCard extends ConsumerStatefulWidget {
  const StatsCard({super.key});

  @override
  ConsumerState<StatsCard> createState() => _StatsCardState();
}

class _StatsCardState extends ConsumerState<StatsCard> {
  bool isMonthly = true;

  @override
  Widget build(BuildContext context) {
    final inProgressCount = ref.watch(inProgressCountProvider);
    final asyncStats = ref.watch(
      profileStatsProvider(isMonthly ? StatsType.monthly : StatsType.allTime),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderDefault),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildTabButton(
                        context,
                        AppLocalizations.of(context)!.thisMonth,
                        isMonthly,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: _buildTabButton(
                        context,
                        AppLocalizations.of(context)!.allTime,
                        !isMonthly,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            switch (asyncStats) {
              AsyncLoading() => Center(child: CircularProgressIndicator()),
              AsyncError(:final error) => Text(error.toString()),
              AsyncData(:final value) => Column(
                children: [
                  _buildStatRow(
                    context,
                    AppLocalizations.of(context)!.activeProjects,
                    "$inProgressCount",
                  ),
                  Divider(color: AppColors.borderDefault),
                  _buildStatRow(
                    context,
                    AppLocalizations.of(context)!.totalHours,
                    TimeUtils.format(value.totalMinutes),
                  ),
                  Divider(color: AppColors.borderDefault),
                  _buildStatRow(
                    context,
                    AppLocalizations.of(context)!.revenue,
                    '+${NumberFormat('#,###').format(value.totalIncome)}',
                    color: AppColors.success,
                  ),
                  Divider(color: AppColors.borderDefault),
                  _buildStatRow(
                    context,
                    AppLocalizations.of(context)!.expenses,
                    '-${NumberFormat('#,###').format(value.totalExpense)}',
                    color: AppColors.errorSoft,
                  ),
                  Divider(color: AppColors.borderDefault),
                  _buildStatRow(
                    context,
                    AppLocalizations.of(context)!.netProfit,
                    NumberFormat('#,###').format(value.netIncome),
                    color: AppColors.success,
                  ),
                ],
              ),
              _ => SizedBox.shrink(),
            },
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Row _buildStatRow(BuildContext context, String label, String value, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: label == AppLocalizations.of(context)!.netProfit
              ? AppTextStyles.bodyBold(context)
              : AppTextStyles.body(context),
        ),
        Text(
          value,
          style: AppTextStyles.bodyBold(context).copyWith(color: color ?? AppColors.textPrimary),
        ),
      ],
    );
  }

  GestureDetector _buildTabButton(BuildContext context, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMonthly = label == AppLocalizations.of(context)!.thisMonth;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? AppColors.borderDefault : Colors.transparent),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.body(context).copyWith(
              color: isSelected ? AppColors.textPrimary : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
