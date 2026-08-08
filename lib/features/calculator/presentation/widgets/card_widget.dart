import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/pricing_calculator.dart';
import 'package:free_log/core/widgets/text_field/hour_text_field.dart';
import 'package:free_log/core/widgets/text_field/hourly_rate_field_widget.dart';
import 'package:free_log/core/widgets/text_field/margin_rate_field.dart';
import 'package:free_log/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.hourlyRateController,
    required this.hourController,
    required this.expenseController,
    required this.marginRateController,
  });
  final TextEditingController hourlyRateController;
  final TextEditingController hourController;

  final TextEditingController expenseController;
  final TextEditingController marginRateController;

  double get _hourlyRate =>
      double.tryParse(hourlyRateController.text.replaceAll(',', '')) ?? 0;
  double get _hours =>
      double.tryParse(hourController.text.replaceAll('h', '')) ?? 0;
  double get _expense =>
      double.tryParse(expenseController.text.replaceAll(',', '')) ?? 0;
  double get _marginRate =>
      (double.tryParse(marginRateController.text) ?? 0) / 100;

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
                  AppLocalizations.of(context)!.hourlyRate,
                  HourlyRateField(
                    controller: hourlyRateController,
                    hintText: '0',
                    errorText: AppLocalizations.of(context)!.hourlyRateError,
                    maxDigits: 8,
                  ),
                ),
                const Divider(color: AppColors.borderDefault),
                _rowWidget(
                  context,
                  AppLocalizations.of(context)!.timeEntryTitle,
                  HourTextField(controller: hourController, hintText: '0'),
                ),
                const Divider(color: AppColors.borderDefault),
                _rowWidget(
                  context,
                  AppLocalizations.of(context)!.expenses,
                  HourlyRateField(
                    controller: expenseController,
                    hintText: '0',
                    errorText: AppLocalizations.of(context)!.valieAmount,
                    maxDigits: 8,
                  ),
                ),
                const Divider(color: AppColors.borderDefault),
                _rowWidget(
                  context,
                  AppLocalizations.of(context)!.marginRate,
                  MarginRateField(controller: marginRateController),
                ),
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
              final pricing = PricingCalculator.calculate(
                hourlyRate: _hourlyRate,
                hours: _hours,
                expense: _expense,
                marginRate: _marginRate,
              );
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
                      _bottomRowWidget(
                        context,
                        AppLocalizations.of(context)!.hourlyRateXHours,
                        fmt.format(pricing.laborCost.floor()),
                      ),
                      const SizedBox(height: 6),
                      _bottomRowWidget(
                        context,
                        AppLocalizations.of(context)!.expenses,
                        fmt.format(_expense.floor()),
                      ),
                      const SizedBox(height: 6),
                      _bottomRowWidget(
                        context,
                        '${AppLocalizations.of(context)!.marginRate} (${int.tryParse(marginRateController.text) ?? 0})%',
                        '+${fmt.format(pricing.marginAmount.floor())}',
                      ),
                      const SizedBox(height: 6),
                      const Divider(thickness: 0.5, color: Colors.white),
                      _bottomRowWidget(
                        context,
                        AppLocalizations.of(context)!.sellingPrice,
                        fmt.format(pricing.sellingPrice.floor()),
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

  Row _bottomRowWidget(
    BuildContext context,
    String title,
    String amount, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isBold
              ? AppTextStyles.title(context).copyWith(color: Colors.white)
              : AppTextStyles.subTitleBold(
                  context,
                ).copyWith(color: Colors.white),
        ),
        Text(
          amount,
          style: isBold
              ? AppTextStyles.headline(context).copyWith(color: Colors.white)
              : AppTextStyles.subTitleBold(
                  context,
                ).copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Padding _rowWidget(BuildContext context, String text, Widget field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Text(text, style: AppTextStyles.subTitleBold(context)),
            ],
          ),
          SizedBox(width: 160, child: field),
        ],
      ),
    );
  }
}
