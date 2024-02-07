import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_much/design/corner.radius.dart';
import 'package:how_much/design/padding.dart';
import 'package:how_much/design/sizes.dart';

import 'vertical.button.dart';

class SideMenuBar extends StatefulWidget {
  final List<String> titles;
  final int selectedIndex;
  final void Function(int)? onPressed;

  const SideMenuBar({
    super.key,
    required this.titles,
    this.onPressed,
    required this.selectedIndex,
  });

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.selectedIndex;

    return Container(
      width: Sizes.sideMenuBarWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(CornerRadius.large),
          bottomRight: Radius.circular(CornerRadius.large),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.titles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: PaddingConstants.xsmall),
              child: VerticalButton(
                constraints: constraints,
                title: widget.titles[index],
                isSelected: (index == selectedIndex),
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                    widget.onPressed?.call(index);
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
