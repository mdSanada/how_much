import 'package:flutter/cupertino.dart';

import '../../../design/sizes.dart';
import '../../../design/stylesheet.dart';
import '../../../widgets/spacing.dart';
import 'settings.icon.action.dart';

class SettingIconActionGroupedCollection extends StatelessWidget {
  final String title;
  final List<SettingsIconAction> items;

  const SettingIconActionGroupedCollection({
    super.key,
    required this.items,
    required this.title,
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
          child: Column(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => const Spacing(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          color: Stylesheet.white,
                          borderRadius: BorderRadius.circular(Sizes.small),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          onPressed: items[index].onPressed,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                items[index].icon,
                                color: Stylesheet.primaryColor,
                              ),
                              Spacing(),
                              Text(
                                items[index].title,
                                style: Stylesheet.body(),
                              ),
                            ],
                          ),
                        ),
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
