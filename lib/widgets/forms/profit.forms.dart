import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_much/consts/strings.dart';

import '../../design/stylesheet.dart';
import '../../modules/home/domain/entities/profit.type.dart';
import 'profit.row.description.dart';
import 'profit.segment.form.dart';
import 'profit.value.form.dart';

class ProfitFormsWidget extends StatefulWidget {
  final bool isUserInteractionEnabled;
  final double profit;
  final double cost;
  final double price;
  final double percentage;
  final ProfitType profitType;

  final Function(double) onProfitChanged;
  final Function(ProfitType) onProfitTypeChanged;

  const ProfitFormsWidget({
    super.key,
    required this.onProfitChanged,
    required this.isUserInteractionEnabled,
    required this.profit,
    required this.onProfitTypeChanged,
    required this.cost,
    required this.price,
    required this.percentage,
    required this.profitType,
  });

  @override
  State<ProfitFormsWidget> createState() => _ProfitFormsWidgetState();
}

class _ProfitFormsWidgetState extends State<ProfitFormsWidget> {
  ProfitType _selectedSegment = ProfitType.percentage;

  @override
  Widget build(BuildContext context) {
    _selectedSegment = widget.profitType;
    var isUserInteractionEnabled = widget.isUserInteractionEnabled;
    return Expanded(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: IgnorePointer(
          ignoring: !isUserInteractionEnabled,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfitSegmentForm(
                  value: _selectedSegment,
                  onValueChanged: (profit) {
                    setState(() {
                      _selectedSegment = profit;
                      widget.onProfitTypeChanged(profit);
                    });
                  },
                ),
                ProfitValueForm(
                  profit: widget.profit,
                  type: _selectedSegment,
                  onProfitChanged: widget.onProfitChanged,
                ),
                ProfitRowDescription(
                  color: Stylesheet.error,
                  title: StringsConsts.totalCost,
                  value: widget.cost,
                ),
                ProfitRowDescription(
                  color: Stylesheet.secondaryColor,
                  title: StringsConsts.priceSell,
                  value: widget.price,
                  hasProfit: true,
                  profit: widget.percentage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
