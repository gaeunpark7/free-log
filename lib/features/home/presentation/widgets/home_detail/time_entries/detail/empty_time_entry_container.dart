import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/l10n/app_localizations.dart';

class EmptyTimeEntryContainer extends StatelessWidget {
  const EmptyTimeEntryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.height(context) * 0.2,
      width: double.infinity,
      decoration: DottedDecoration(
        shape: Shape.box,
        borderRadius: BorderRadius.circular(12),
        color: AppColors.textTertiary,
        dash: const [5, 4],
        strokeWidth: 2,
      ),
      child: Container(
        padding: Responsive.cardPadding(context),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.schedule, size: 40, color: AppColors.textTertiary),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.noTimeEntries,

              style: AppTextStyles.caption(
                context,
              ).copyWith(color: AppColors.textTertiary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
