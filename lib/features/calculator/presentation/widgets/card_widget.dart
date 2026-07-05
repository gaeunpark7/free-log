import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/widgets/text_field/hour_text_field.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/core/widgets/text_field/margin_rate_field.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  final TextEditingController hourlyRateController;
  final TextEditingController hourController;

  final TextEditingController expenseController;
  final TextEditingController marginRateController;

  const CardWidget({
    super.key,
    required this.hourlyRateController,
    required this.hourController,
    required this.expenseController,
    required this.marginRateController,
  });

  double get _hourlyRate => double.tryParse(hourlyRateController.text.replaceAll(',', '')) ?? 0;
  double get _hours => double.tryParse(hourController.text.replaceAll('h', '')) ?? 0;
  double get _expense => double.tryParse(expenseController.text.replaceAll(',', '')) ?? 0;
  double get _marginRate => (double.tryParse(marginRateController.text) ?? 0) / 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _rowWidget(
                  context,
                  '시급',
                  HourlyRateField(
                    controller: hourlyRateController,
                    hintText: '0',
                    errorText: '시급을 입력하세요.',
                    maxDigits: 8,
                  ),
                ),
                Divider(color: AppColors.borderDefault),
                _rowWidget(
                  context,
                  '작업시간',
                  HourTextField(controller: hourController, hintText: '0'),
                ),
                Divider(color: AppColors.borderDefault),
                _rowWidget(
                  context,
                  '재료비',
                  HourlyRateField(
                    controller: expenseController,
                    hintText: '0',
                    errorText: '재료비를 입력하세요.',
                    maxDigits: 8,
                  ),
                ),
                Divider(color: AppColors.borderDefault),
                _rowWidget(context, '마진율', MarginRateField(controller: marginRateController)),
              ],
            ),
          ),
          ListenableBuilder(
            listenable: Listenable.merge([
              hourlyRateController,
              hourController,
              expenseController,
              marginRateController,
            ]),
            builder: (context, _) {
              final laborCost = _hourlyRate * _hours;
              final totalCost = laborCost + _expense;
              final margin = totalCost * _marginRate;
              final sellingPrice = totalCost + margin;
              final fmt = NumberFormat('#,###');

              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    children: [
                      _bottomRowWidget(context, '시급 X 시간', '₩${fmt.format(laborCost.floor())}'),
                      const SizedBox(height: 6),
                      _bottomRowWidget(context, '재료비', '₩${fmt.format(_expense.floor())}'),
                      const SizedBox(height: 6),
                      _bottomRowWidget(
                        context,
                        '마진 (${marginRateController.text.isEmpty ? '0' : marginRateController.text}%)',
                        '+₩${fmt.format(margin.floor())}',
                      ),
                      const SizedBox(height: 6),
                      const Divider(thickness: 0.5, color: Colors.white),
                      _bottomRowWidget(
                        context,
                        '최종 견적가',
                        '₩${fmt.format(sellingPrice.floor())}',
                        isBold: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Row _bottomRowWidget(BuildContext context, String title, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isBold
              ? AppTextStyles.title(context).copyWith(color: Colors.white)
              : AppTextStyles.subTitle(context).copyWith(color: Colors.white),
        ),
        Text(
          amount,
          style: isBold
              ? AppTextStyles.headline(context).copyWith(color: Colors.white)
              : AppTextStyles.subTitleBold(context).copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Padding _rowWidget(BuildContext context, String text, Widget field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Text(text, style: AppTextStyles.title(context)),
            ],
          ),
          SizedBox(width: 160, child: field),
        ],
      ),
    );
  }
}
