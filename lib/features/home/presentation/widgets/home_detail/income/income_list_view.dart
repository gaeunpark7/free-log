import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/features/home/domain/model/income_model.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/income/edit_income_dialog.dart';
import 'package:intl/intl.dart';

class IncomeListView extends StatelessWidget {
  final List<IncomeModel> income;
  const IncomeListView({super.key, required this.income});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true,
      physics: income.length > 4
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: income.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => EditIncomeDialog(income: income[index]),
              //  EditExpenseDialog(expense: expense[index]),
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(income[index].description, style: AppTextStyles.subTitle(context)),
                        Text(
                          '${income[index].receivedAt.toLocal().year}.'
                          '${income[index].receivedAt.toLocal().month.toString().padLeft(2, '0')}.'
                          '${income[index].receivedAt.toLocal().day.toString().padLeft(2, '0')}',
                          style: AppTextStyles.caption(context),
                        ),
                      ],
                    ),
                    Text(
                      '+${NumberFormat('#,##0').format(income[index].amount)}',
                      style: AppTextStyles.subTitleBold(context).copyWith(color: AppColors.success),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 0.5, color: AppColors.textTertiary),
            ],
          ),
        );
      },
    );
  }
}
