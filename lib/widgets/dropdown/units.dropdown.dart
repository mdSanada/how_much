import 'package:flutter/material.dart';
import '../../calculator/calculator.dart';
import '../../design/padding.dart';

class UnitsDropdown extends StatefulWidget {
  final List<Measures> list;
  final Measures? initialValue;
  final ValueChanged<Measures> onSelected;

  const UnitsDropdown({
    super.key,
    required this.list,
    required this.onSelected,
    this.initialValue,
  });

  @override
  State<UnitsDropdown> createState() => _UnitsDropdownState();
}

class _UnitsDropdownState extends State<UnitsDropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = MeasuresManager.stringfy(widget.list.first);
    if (widget.initialValue != null &&
        widget.list.contains(widget.initialValue)) {
      dropdownValue = MeasuresManager.stringfy(widget.initialValue!);
    }
    widget.onSelected(MeasuresManager.toMeasure(dropdownValue));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: PaddingConstants.small,
        right: PaddingConstants.large,
        bottom: PaddingConstants.sMedium,
      ),
      child: DropdownMenu<String>(
        initialSelection: dropdownValue,
        width: 100,
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
          if (value != null) {
            widget.onSelected(
              MeasuresManager.toMeasure(value),
            );
          }
        },
        dropdownMenuEntries:
            widget.list.map<DropdownMenuEntry<String>>((value) {
          final String label = MeasuresManager.stringfy(value);
          return DropdownMenuEntry<String>(value: label, label: label);
        }).toList(),
      ),
    );
  }
}
