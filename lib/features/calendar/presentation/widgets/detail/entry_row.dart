import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_text_style.dart';

class EntryRow extends StatelessWidget {
  const EntryRow({
    super.key,
    required this.description,
    required this.projectName,
    required this.amount,
    required this.amountColor,
  });
  final String description;
  final String projectName;
  final String amount;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: AppTextStyles.bodyBold(context)),
                if (projectName.isNotEmpty)
                  Text(
                    projectName,
                    style: AppTextStyles.caption(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            amount,
            style: AppTextStyles.subTitleBold(
              context,
            ).copyWith(color: amountColor, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
