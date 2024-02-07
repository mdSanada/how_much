import 'package:flutter/cupertino.dart';

import '../../design/padding.dart';
import '../../design/stylesheet.dart';
import '../../modules/home/domain/entities/profit.type.dart';

class ProfitSegmentForm extends StatefulWidget {
  final ProfitType value;
  final Function(ProfitType) onValueChanged;

  const ProfitSegmentForm({
    super.key,
    required this.value,
    required this.onValueChanged,
  });

  @override
  State<ProfitSegmentForm> createState() => _ProfitSegmentFormState();
}

class _ProfitSegmentFormState extends State<ProfitSegmentForm> {
  @override
  Widget build(BuildContext context) {
    ProfitType _selectedSegment = widget.value;

    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingConstants.medium,
        left: PaddingConstants.large,
        right: PaddingConstants.large,
        bottom: PaddingConstants.small,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: PaddingConstants.small),
              child: Text(
                'Desejo escolher por:',
                textAlign: TextAlign.start,
                style: Stylesheet.body(),
              ),
            ),
            CupertinoSlidingSegmentedControl<ProfitType>(
              backgroundColor: Stylesheet.lightGray,
              thumbColor: selectedColor[_selectedSegment]!,
              groupValue: _selectedSegment,
              onValueChanged: (ProfitType? value) {
                if (value != null) {
                  setState(() {
                    _selectedSegment = value;
                    widget.onValueChanged(value);
                  });
                }
              },
              children: <ProfitType, Widget>{
                ProfitType.percentage: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Porcentagem',
                    style: (_selectedSegment == ProfitType.percentage)
                        ? Stylesheet.caption(
                            color: Stylesheet.white,
                          )
                        : Stylesheet.caption(),
                  ),
                ),
                ProfitType.value: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Valor',
                    style: (_selectedSegment == ProfitType.value)
                        ? Stylesheet.caption(
                            color: Stylesheet.white,
                          )
                        : Stylesheet.caption(),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
