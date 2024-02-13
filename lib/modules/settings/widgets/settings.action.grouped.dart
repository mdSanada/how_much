import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design/corner.radius.dart';
import '../../../design/opacity.dart';
import '../../../design/sizes.dart';
import '../../../design/stylesheet.dart';
import '../../../widgets/buttons/box.button.dart';
import '../../../widgets/inset_grouped/key.value.model.dart';
import '../../../widgets/spacing.dart';

class SettingActionGroupedCollection extends StatelessWidget {
  final String title;
  final List<KeyValue> items;

  const SettingActionGroupedCollection(
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
          decoration: BoxDecoration(
            color: Stylesheet.white,
            borderRadius: BorderRadius.circular(Sizes.small),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(Sizes.small),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Spacing(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index].value,
                              style:
                                  Stylesheet.body(fontWeight: FontWeight.w600),
                            ),
                            BoxButton(
                              onPressed: () {},
                              title: 'Comprar',
                              textStyle:
                                  Stylesheet.body(color: Stylesheet.white),
                              gradient: const LinearGradient(
                                colors: [
                                  Stylesheet.tertiaryColor,
                                  Stylesheet.primaryColor,
                                ],
                              ),
                              height: Sizes.smallButton,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Spacing(
                size: Sizes.small,
              ),
              Row(
                children: [
                  Expanded(
                    child: BoxButton(
                      title: 'Ver Benefícios',
                      textStyle:
                          Stylesheet.body(color: Stylesheet.secondaryColor),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(
                          CornerRadius.medium,
                        ),
                      ),
                      height: Sizes.button,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      backgroundColor: Stylesheet.secondaryColor.withOpacity(
                          OpacityConstants.superlow), //Colors.transparent,
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
