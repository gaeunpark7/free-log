class PricingResult {
  final double laborCost; // 시급 * 시간
  final double totalCost; // laborCost + 지출
  final double marginAmount; // 마진
  final double sellingPrice; // 최종 판매가

  const PricingResult({
    required this.laborCost,
    required this.totalCost,
    required this.marginAmount,
    required this.sellingPrice,
  });
}

class PricingCalculator {
  static PricingResult calculate({
    required double hourlyRate,
    required double hours,
    required double expense,
    required double marginRate,
  }) {
    final laborCost = hourlyRate * hours;
    final totalCost = laborCost + expense;
    final marginAmount = totalCost * marginRate;
    final sellingPrice = totalCost + marginAmount;

    return PricingResult(
      laborCost: laborCost,
      totalCost: totalCost,
      marginAmount: marginAmount,
      sellingPrice: sellingPrice,
    );
  }
}
