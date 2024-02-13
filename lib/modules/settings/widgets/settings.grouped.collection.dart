import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design/sizes.dart';
import '../../../design/stylesheet.dart';
import '../../../widgets/inset_grouped/key.value.model.dart';
import '../../../widgets/spacing.dart';

class SettingGroupedCollection extends StatelessWidget {
  final String title;
  final List<KeyValue> items;

  const SettingGroupedCollection(
      {super.key, required this.items, required this.title});

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
          child: Column(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => const Spacing(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: items[index].key.isNotEmpty,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].key,
                              style: Stylesheet.body(),
                            ),
                            const Spacing(
                              size: Sizes.small,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        items[index].value,
                        style: Stylesheet.body(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
