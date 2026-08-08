import 'package:flutter/material.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/calculator/presentation/widgets/card_widget.dart';
import 'package:free_log/features/calculator/presentation/widgets/title_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _hourlyRateController = TextEditingController();
  final _hourController = TextEditingController();
  final _expenseController = TextEditingController();
  final _marginRateController = TextEditingController();

  @override
  void dispose() {
    _hourlyRateController.dispose();
    _hourController.dispose();
    _expenseController.dispose();
    _marginRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWidget(),
            Padding(
              padding: Responsive.screenPadding(context),
              child: CardWidget(
                hourlyRateController: _hourlyRateController,
                hourController: _hourController,
                expenseController: _expenseController,
                marginRateController: _marginRateController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
