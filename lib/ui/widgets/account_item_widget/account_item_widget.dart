import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/core/domains.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AccountItemWidget extends StatelessWidget {
  final AccountOjbModel accountModel;
  final bool isLastItem;
  final Function()? onTapSubButton;
  final Function()? onCallBackPop;
  final Function()? onLongPress;
  final Function()? onSelect;
  final Widget? subIcon;
  const AccountItemWidget({
    super.key,
    this.onCallBackPop,
    required this.accountModel,
    required this.isLastItem,
    this.onLongPress,
    this.onTapSubButton,
    this.onSelect,
    this.subIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<RootPR>(context, listen: false).themeMode == ThemeMode.dark;
    Widget accountIcon() {
      if (accountModel.icon == "default" || accountModel.icon == null) {
        return Text(decryptInfo(accountModel.title)[0].toUpperCase(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ));
      }
      final branchLogo = allBranchLogos.firstWhere(
        (element) => element.branchLogoSlug == accountModel.icon,
        orElse: () => BranchLogo(
          [],
          "default",
        ),
      );
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          isDarkMode
              ? branchLogo.branchLogoPathDarkMode!
              : branchLogo.branchLogoPathLightMode!,
          fit: BoxFit.contain,
          width: 50.h,
          height: 50.h,
        ),
      );
    }

    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: InkWell(
        onLongPress: onLongPress,
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.detailsAccountRoute,
            arguments: {"id": accountModel.id},
          ).then((value) {
            if (value == null) return;

            if (value == true) {
              onCallBackPop?.call();
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  onSelect?.call();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ColoredBox(
                    color: Colors.grey.withOpacity(0.2),
                    child: Center(
                      child: SizedBox(
                        width: 50.h,
                        height: 50.h,
                        child: Center(
                          child: ValueListenableBuilder(
                              valueListenable:
                                  DataShared.instance.accountSelected,
                              builder: (context, selectedAccounts, child) {
                                bool isSelected = selectedAccounts
                                    .where((element) =>
                                        element.id == accountModel.id)
                                    .isNotEmpty;

                                return isSelected
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )
                                    : accountIcon();
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: isLastItem
                        ? null
                        : Border(
                            bottom: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                            ),
                          ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                decryptInfo(accountModel.title),
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              if (accountModel.email != null &&
                                  accountModel.email!.isNotEmpty)
                                Text(
                                  decryptInfo(accountModel.email!),
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                      fontSize: 12.sp),
                                ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: onTapSubButton != null || subIcon == null,
                          replacement:
                              Center(child: subIcon ?? const SizedBox()),
                          child: IconButton(
                            onPressed: onTapSubButton,
                            icon: Icon(
                              Icons.more_vert,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
