import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/features/home/domain/model/expense_model.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/expense/edit_expense_dialog.dart';
import 'package:intl/intl.dart';

class ExpenseListView extends StatelessWidget {
  final List<ExpenseModel> expense;

  const ExpenseListView({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true,
      physics: expense.length > 4
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: expense.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => EditExpenseDialog(expense: expense[index]),
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
                        Text(expense[index].description, style: AppTextStyles.subTitle(context)),
                        Text(
                          '${expense[index].spentAt.toLocal().year}.'
                          '${expense[index].spentAt.toLocal().month.toString().padLeft(2, '0')}.'
                          '${expense[index].spentAt.toLocal().day.toString().padLeft(2, '0')}',
                          style: AppTextStyles.caption(context),
                        ),
                      ],
                    ),
                    Text(
                      '-${NumberFormat('#,##0').format(expense[index].amount)}',
                      style: AppTextStyles.subTitleBold(context),
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
