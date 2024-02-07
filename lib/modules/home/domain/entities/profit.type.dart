import 'dart:ui';

import '../../../../design/stylesheet.dart';

enum ProfitType { value, percentage }

Map<ProfitType, Color> selectedColor = <ProfitType, Color>{
  ProfitType.value: Stylesheet.primaryColor,
  ProfitType.percentage: Stylesheet.secondaryColor,
};
