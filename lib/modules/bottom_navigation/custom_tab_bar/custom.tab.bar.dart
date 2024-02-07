import 'package:flutter/cupertino.dart';

import '../../../design/corner.radius.dart';
import '../../../design/duration.dart';
import '../../../design/opacity.dart';
import '../../../design/padding.dart';
import '../../../design/sizes.dart';
import '../../../design/stylesheet.dart';
import '../models/tab.item.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key, required this.onTabChange}) : super(key: key);

  final Function(int tabIndex) onTabChange;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final List<TabItem> _icons = TabItem.tabItemsList;

  int _selectedTab = 0;

  void onTabPress(int index) {
    setState(() {
      _selectedTab = index;
    });
    widget.onTabChange(index);

    _icons[index].status = true;
    Future.delayed(AnimationDuration.superslow, () {
      _icons[index].status = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          PaddingConstants.large,
          PaddingConstants.zero,
          PaddingConstants.large,
          PaddingConstants.small,
        ),
        padding: const EdgeInsets.all(1),
        constraints: const BoxConstraints(
          maxWidth: Sizes.maxWidth,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CornerRadius.large),
          gradient: LinearGradient(colors: [
            Stylesheet.black.withOpacity(OpacityConstants.half),
            Stylesheet.black.withOpacity(OpacityConstants.invisible)
          ]),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Stylesheet.black.withOpacity(OpacityConstants.high),
            borderRadius: BorderRadius.circular(
              CornerRadius.large,
            ),
            boxShadow: [
              BoxShadow(
                color: Stylesheet.black.withOpacity(OpacityConstants.low),
                blurRadius: CornerRadius.large,
                offset: const Offset(
                  Sizes.zero,
                  Sizes.sLarge,
                ),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              TabItem icon = _icons[index];

              return Expanded(
                key: icon.id,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(
                    PaddingConstants.sMedium,
                  ),
                  child: AnimatedOpacity(
                    opacity: _selectedTab == index
                        ? OpacityConstants.visible
                        : OpacityConstants.low,
                    duration: AnimationDuration.superfast,
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: -Sizes.largeLine,
                            child: AnimatedContainer(
                              duration: AnimationDuration.superfast,
                              height: Sizes.largeLine,
                              width: _selectedTab == index
                                  ? Sizes.sLarge
                                  : Sizes.zero,
                              decoration: BoxDecoration(
                                color: Stylesheet.primaryColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Sizes.tabbarIcon,
                            width: Sizes.tabbarIcon,
                            child: Icon(
                              icon.icon,
                              color: Stylesheet.backgroundColor,
                            ),
                          )
                        ]),
                  ),
                  onPressed: () {
                    onTabPress(index);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
