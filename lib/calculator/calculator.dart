import '../modules/home/domain/entities/product.material.entity.dart';
import '../modules/home/domain/entities/profit.type.dart';

abstract class CalculatorProtocol {
  double convert(Measures measures, double value, Measures toMeasure);
  double calculateMaterialCost(List<ProductMaterialEntity> materials);
  (double, double) calculatePriceAndProfit(
    ProfitType profitType,
    double value,
    double actualCost,
  );
  double toDefault(Measures measure, double value);
  double fromDefault(Measures measure, double value);
}

class Calculator implements CalculatorProtocol {
  @override
  double convert(Measures measures, double value, Measures toMeasure) {
    final type = MeasuresManager.type[measures];
    final toType = MeasuresManager.type[toMeasure];
    if (type == toType) {
      return value *
          MeasuresManager.values[measures]! /
          MeasuresManager.values[toMeasure]!;
    } else {
      throw Exception('Cannot convert $measures to $toMeasure');
    }
  }

  @override
  double calculateMaterialCost(List<ProductMaterialEntity> materials) {
    final materialsCost = materials.fold<double>(0, (previousValue, element) {
      final quantity = convert(
        element.measure,
        element.quantity,
        element.material.measure,
      );
      final materialCost = (quantity / element.material.quantity);
      return materialCost + previousValue;
    });
    return materialsCost;
  }

  @override
  (double, double) calculatePriceAndProfit(
    ProfitType profitType,
    double value,
    double actualCost,
  ) {
    switch (profitType) {
      case ProfitType.percentage:
        final price = actualCost + (actualCost * (value / 100));
        final profit = value;
        return (price, profit);
      case ProfitType.value:
        final price = value;
        final profit = (value / actualCost) * 100;
        return (price, profit);
    }
  }

  @override
  double fromDefault(Measures measure, double value) {
    final type = MeasuresManager.type[measure];
    final defaultMeasure = MeasuresManager.defaultMeasure[type]!;
    return convert(defaultMeasure, value, measure);
  }

  @override
  double toDefault(Measures measure, double value) {
    final type = MeasuresManager.type[measure];
    final defaultMeasure = MeasuresManager.defaultMeasure[type]!;
    return convert(measure, value, defaultMeasure);
  }
}

enum MeasuresType {
  weight,
  volume,
  unity,
}

enum Measures {
  kilogram,
  gram,
  liter,
  milliliter,
  unity,
}

class MeasuresManager {
  static const String _kilogram = 'kg';
  static const String _gram = 'g';
  static const String _liter = 'L';
  static const String _milliliter = 'ml';
  static const String _unity = 'unidade';

  static Map<Measures, MeasuresType> type = {
    Measures.kilogram: MeasuresType.weight,
    Measures.gram: MeasuresType.weight,
    Measures.liter: MeasuresType.volume,
    Measures.milliliter: MeasuresType.volume,
    Measures.unity: MeasuresType.unity,
  };

  static Map<MeasuresType, Measures> defaultMeasure = {
    MeasuresType.weight: Measures.gram,
    MeasuresType.volume: Measures.milliliter,
    MeasuresType.unity: Measures.unity,
  };

  static Map<Measures, double> values = {
    Measures.kilogram: 1,
    Measures.gram: 0.001,
    Measures.liter: 1,
    Measures.milliliter: 0.001,
    Measures.unity: 1,
  };

  static Map<Measures, String> names = {
    Measures.kilogram: _kilogram,
    Measures.gram: _gram,
    Measures.liter: _liter,
    Measures.milliliter: _milliliter,
    Measures.unity: _unity,
  };

  static Map<String, Measures> measure = {
    _kilogram: Measures.kilogram,
    _gram: Measures.gram,
    _liter: Measures.liter,
    _milliliter: Measures.milliliter,
    _unity: Measures.unity,
  };

  static List<Measures> getAllMeasures() {
    return Measures.values;
  }

  static List<Measures> getMeasures(MeasuresType type) {
    return MeasuresManager.type.entries
        .where((element) => element.value == type)
        .map((e) => e.key)
        .toList();
  }

  static List<Measures> getMeasuresOfSameType(Measures measure) {
    MeasuresType type = MeasuresManager.type[measure]!;
    return MeasuresManager.getMeasures(type);
  }

  static List<Measures> getMeasuresFromString(String type) {
    return MeasuresManager.type.entries
        .where((element) => element.value.toString() == type)
        .map((e) => e.key)
        .toList();
  }

  static String stringfy(Measures value) {
    return names[value]!;
  }

  static Measures toMeasure(String value) {
    return measure[value]!;
  }
}
