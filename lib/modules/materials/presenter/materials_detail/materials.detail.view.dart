import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_much/calculator/calculator.dart';
import 'package:how_much/formatters/number.formatter.dart';

import '../../../../consts/strings.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../formatters/currency.formatter.dart';
import '../../../../widgets/buttons/floating.action.icon.button.dart';
import '../../../../widgets/cells/material.item.widget.dart';
import '../../../../widgets/padding.scrollable.safe.area.dart';
import '../../../../widgets/spacing.dart';
import '../../../../widgets/title.app.bar.dart';
import '../add_material/add.material.view.dart';
import '../../domain/entities/material.entity.dart';

class MaterialsDetailView extends StatelessWidget {
  final MaterialEntity materialEntity;

  const MaterialsDetailView({
    super.key,
    required this.materialEntity,
  });

  @override
  Widget build(BuildContext context) {
    final CurrencyTextInputFormatter currencyFormatter =
        CurrencyFormatter.formatter();

    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        backButtonEnabled: true,
        title: StringsConsts.titleMaterialDetail,
        highlightColor: Stylesheet.primaryColor,
      ),
      floatingActionButton: FloatingIconButton(
        icon: Icons.edit,
        color: Stylesheet.primaryColor,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
            CupertinoModalPopupRoute(
              builder: (context) => AddMaterialView(
                materialEntity: materialEntity,
              ),
            ),
          );
        },
      ),
      body: PaddingScrollableSafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacing(),
            Text(
              materialEntity.name,
              style: Stylesheet.header(),
            ),
            const Spacing(),
            Text(
              materialEntity.description,
              style: Stylesheet.body(),
            ),
            const Spacing(size: Sizes.large),
            MaterialItemWidget(
              title: StringsConsts.formCost,
              value: CurrencyFormatter.number(
                  materialEntity.price, currencyFormatter),
            ),
            const Spacing(
              line: Sizes.thinLine,
            ),
            MaterialItemWidget(
              title: StringsConsts.formQuantity,
              value: NumberFormatter.stringfy(materialEntity.quantity),
            ),
            const Spacing(
              line: Sizes.thinLine,
            ),
            MaterialItemWidget(
              title: StringsConsts.formMeasure,
              value: MeasuresManager.stringfy(materialEntity.measure),
            ),
          ],
        ),
      ),
    );
  }
}
