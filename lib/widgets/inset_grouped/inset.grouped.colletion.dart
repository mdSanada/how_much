import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../design/stylesheet.dart';
import '../../../../../widgets/spacing.dart';
import '../../design/sizes.dart';
import 'key.value.model.dart';

class InsetGroupedCollection extends StatelessWidget {
  final String title;
  final List<KeyValue> items;

  const InsetGroupedCollection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Stylesheet.caption(),
        ),
        const Spacing(
          size: Sizes.small,
        ),
        Container(
          padding: const EdgeInsets.all(Sizes.small),
          decoration: BoxDecoration(
            color: Stylesheet.white,
            borderRadius: BorderRadius.circular(Sizes.small),
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Spacing(
              line: Sizes.thinLine,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      items[index].key,
                      style: Stylesheet.body(),
                    ),
                    Text(
                      items[index].value,
                      style: Stylesheet.body(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
