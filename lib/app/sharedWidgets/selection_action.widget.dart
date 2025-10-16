import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:masar/app/data/models/country.model.dart';
import 'package:masar/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../core/theme/app_text_styles.dart';
import '../core/values/utils/general_decoration.dart';
import '../data/models/action_selectable.dart';
import 'custom_card.dart';

class SelectionActionWidget extends StatefulWidget {
  const SelectionActionWidget({
    super.key,
    required this.items,
    required this.currentItem,
    this.hasSearch = false,
    this.isShowCountryCode = false,
    this.widgetNote,
  });
  final List<ActionSelectable> items;
  final bool hasSearch;
  final Widget? widgetNote;
  final bool isShowCountryCode;
  final ActionSelectable? currentItem;

  @override
  State<SelectionActionWidget> createState() => _SelectionActionWidgetState();
}

class _SelectionActionWidgetState extends State<SelectionActionWidget> {
  List<ActionSelectable> listToShow = [];
  TextEditingController search = TextEditingController();
  int itemCount = 10;

  @override
  void initState() {
    listToShow = widget.items;
    search.addListener(() {
      String word = search.text;
      if (word.isEmpty) {
        listToShow = widget.items;
      } else {
        listToShow = widget.items
            .where((element) => element.selectableName
                .toLowerCase()
                .contains(word.toLowerCase()))
            .toList();
      }
      setState(() {});
    });

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        EasyLoading.dismiss();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    itemCount = widget.hasSearch
        ? search.text.isEmpty
            ? listToShow.length
            : widget.items.length
        : listToShow.length;

    if (widget.hasSearch == true) {
      return Material(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: itemCount < 5
              ? 0.38.sh
              : itemCount < 10
                  ? 0.48.sh
                  : 0.50.sh,
          child: Column(
            children: [
              const Divider(
                thickness: 0.2,
                height: 1,
                color: Colors.transparent,
                endIndent: 18,
                indent: 18,
              ),
              Visibility(
                visible: widget.hasSearch == true,
                child: Material(
                  child: _buildSearchField(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: CustomScrollView(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  slivers: [
                    // SliverList(
                    //   delegate: SliverChildListDelegate(
                    //     [
                    //       const Divider(
                    //         thickness: 0.2,
                    //         height: 1,
                    //         color: Colors.transparent,
                    //         endIndent: 18,
                    //         indent: 18,
                    //       ),
                    //       Visibility(
                    //         visible: widget.hasSearch == true,
                    //         child: _buildSearchField(),
                    //       ),
                    //       const SizedBox(
                    //         height: 5,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Column(
                            children: [
                              _widgetItem(index),
                              const SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 1,
                                thickness: 0.15,
                                color: Colors.grey.shade600,
                                endIndent: 18,
                                indent: 18,
                              ),
                            ],
                          );
                        },
                        childCount: listToShow.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          if (widget.widgetNote != null) ...[
                            const SizedBox(
                              height: 15,
                            ),
                            widget.widgetNote ?? const SizedBox(),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                          if (widget.widgetNote == null) ...[
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.2,
              height: 1,
              color: Colors.transparent,
              endIndent: 18,
              indent: 18,
            ),
            Visibility(
              visible: widget.hasSearch == true,
              child: _buildSearchField(),
            ),
            // Visibility(
            //   visible: widget.hasSearch == true,
            //   child: _buildSearchField(),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: List.generate(
                  listToShow.length,
                  (index) => Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 110.h,
                        child: CupertinoActionSheetAction(
                          child: CustomCard(
                            elevation: 0,
                            color: (widget.currentItem != null)
                                ? widget.currentItem?.selectableName ==
                                        listToShow[index].selectableName
                                    ? Colors.grey.shade200
                                    : Colors.white
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                0,
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Visibility(
                                    visible: listToShow[index]
                                                .selectableImage !=
                                            null &&
                                        listToShow[index].selectableImage != '',
                                    child: Visibility(
                                      replacement: Text(
                                        listToShow[index].selectableImage ?? "",
                                        style: AppTextStyles.r15.copyWith(
                                            color: Colors.grey.shade700),
                                      ),
                                      visible:
                                          (listToShow[index] is CountryModel),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10000),
                                        child: Container(
                                          // borderRadius: BorderRadius.circular(100),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            width: 35,
                                            height: 35,
                                            imageUrl: listToShow[index]
                                                    .selectableImage ??
                                                "",
                                            placeholder: (c, s) {
                                              return shimmerImage(
                                                context: context,
                                                height: 35,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (widget.isShowCountryCode == true)
                                    const Spacer(),
                                  if (widget.isShowCountryCode == false)
                                    SizedBox(
                                      width:
                                          (listToShow[index].selectableImage ==
                                                      null ||
                                                  listToShow[index]
                                                          .selectableImage ==
                                                      '')
                                              ? 0
                                              : 20,
                                    ),
                                  if (listToShow[index].selectableImage ==
                                          null ||
                                      listToShow[index].selectableImage == '')
                                    const Spacer(),
                                  SizedBox(
                                    width: 0.68.sw,
                                    child: Text(
                                      listToShow[index]
                                          .selectableName
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                  if (widget.isShowCountryCode == false)
                                    const Spacer(),
                                  if (listToShow[index].selectableCountryCode !=
                                          null &&
                                      listToShow[index].selectableCountryCode !=
                                          '' &&
                                      widget.isShowCountryCode == true) ...[
                                    const Spacer(),
                                    Text(
                                      listToShow[index]
                                          .selectableCountryCode
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.back(
                              result: listToShow[index],
                            );
                          },
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     // Logger().e(widget.currentItem?.selectableName);
                      //     // Logger().e(toShow[index].selectableName);
                      //     Get.back(
                      //       result: listToShow[index],
                      //     );
                      //   },
                      //   child: CustomCard(
                      //     elevation: 0,
                      //     color: (widget.currentItem != null)
                      //         ? widget.currentItem?.selectableName ==
                      //         listToShow[index].selectableName
                      //         ? Colors.grey.shade200
                      //         : Colors.white
                      //         : Colors.white,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(
                      //         20,
                      //       ),
                      //       child: Row(
                      //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         // mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           const SizedBox(
                      //             width: 10,
                      //           ),
                      //           Visibility(
                      //             visible:
                      //             listToShow[index].selectableImage != null &&
                      //                 listToShow[index].selectableImage != '',
                      //             child: Visibility(
                      //               replacement: Text(
                      //                 listToShow[index].selectableImage ?? "",
                      //                 style: AppTextStyles.r15.copyWith(
                      //                     color: Colors.grey.shade700),
                      //               ),
                      //               visible: (listToShow[index] is CountryModel ),
                      //               child: ClipRRect(
                      //                 borderRadius:
                      //                 BorderRadius.circular(10000),
                      //                 child: Container(
                      //                   // borderRadius: BorderRadius.circular(100),
                      //                   decoration: const BoxDecoration(
                      //                     shape: BoxShape.circle,
                      //                   ),
                      //                   child: CachedNetworkImage(
                      //                     width: 35,
                      //                     height: 35,
                      //                     imageUrl:
                      //                     listToShow[index].selectableImage ??
                      //                         "",
                      //                     placeholder: (c, s) {
                      //                       return shimmerImage(
                      //                         context: context,
                      //                         height: 35,
                      //                       );
                      //                     },
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           if (widget.isShowCountryCode == true)
                      //             const Spacer(),
                      //           if (widget.isShowCountryCode == false)
                      //             SizedBox(
                      //               width: (listToShow[index].selectableImage ==
                      //                   null ||
                      //                   listToShow[index].selectableImage == '')
                      //                   ? 0
                      //                   : 20,
                      //             ),
                      //           if (listToShow[index].selectableImage == null ||
                      //               listToShow[index].selectableImage == '')
                      //             const Spacer(),
                      //           SizedBox(
                      //             width: 0.68.sw,
                      //             child: Text(
                      //               listToShow[index].selectableName.toString(),
                      //               textAlign: TextAlign.center,
                      //               style: Theme.of(Get.context!)
                      //                   .textTheme
                      //                   .headlineMedium
                      //                   ?.copyWith(
                      //                 fontSize: 14,
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //           ),
                      //           if (widget.isShowCountryCode == false)
                      //             const Spacer(),
                      //           if (listToShow[index].selectableCountryCode !=
                      //               null &&
                      //               listToShow[index].selectableCountryCode != '' &&
                      //               widget.isShowCountryCode == true) ...[
                      //             const Spacer(),
                      //             Text(
                      //               listToShow[index]
                      //                   .selectableCountryCode
                      //                   .toString(),
                      //               textAlign: TextAlign.center,
                      //               style: Theme.of(Get.context!)
                      //                   .textTheme
                      //                   .headlineMedium
                      //                   ?.copyWith(
                      //                 fontSize: 14,
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               width: 5,
                      //             ),
                      //           ],
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Visibility(
                        visible:
                            (listToShow[index] == listToShow.last) == false,
                        child: Divider(
                          thickness: 0.25,
                          height: 1,
                          color: Colors.grey.shade400,
                          endIndent: 5,
                          indent: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.widgetNote != null) ...[
              const SizedBox(
                height: 15,
              ),
              widget.widgetNote ?? const SizedBox(),
              SizedBox(
                height: 30.h,
              ),
            ],
            if (widget.widgetNote == null) ...[
              SizedBox(
                height: 30.h,
              ),
            ],
          ],
        ),
      );
    }
  }

  _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      child: Material(
        // color: Colors.white,
        // surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: TextField(
          controller: search,
          autofocus: true,
          decoration: searchInputDecoration(
            color: Colors.transparent,
            hint: "ابحث هنا".tr,
          ),
        ),
      ),
    );
  }

  _widgetItem(index) {
    ActionSelectable? item = listToShow[index];
    bool checked =
        widget.currentItem?.selectableName == listToShow[index].selectableName;
    return CupertinoActionSheetAction(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 8.0,
          end: 8.0,
          top: 10,
          bottom: 0,
        ),
        child: CustomCard(
          color: Colors.white,
          elevation: 0,
          child: CustomCard(
            elevation: 0,
            color: (widget.currentItem != null)
                ? checked
                    ? Colors.grey.shade200
                    : Colors.white
                : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(
                (widget.currentItem != null)
                    ? checked
                        ? listToShow.length <= 5
                            ? 12
                            : 10.0
                        : listToShow.length <= 5
                            ? 12
                            : 8
                    : listToShow.length <= 5
                        ? 12
                        : 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (item.selectableCountryCode != null &&
                      item.selectableCountryCode != '' &&
                      widget.isShowCountryCode == true)
                    Expanded(
                      flex: widget.isShowCountryCode == true ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8.0),
                        child: AutoSizeText(
                          item.selectableCountryCode.toString(),
                          maxFontSize: 14,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 12,
                          style: AppTextStyles.r14.copyWith(
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    flex: widget.isShowCountryCode == true ? 4 : 1,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      child: AutoSizeText(
                        item.selectableName,
                        maxFontSize: 14,
                        textAlign: widget.isShowCountryCode == true
                            ? TextAlign.center
                            : TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 12,
                        style: AppTextStyles.r14.copyWith(
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                  if (item.selectableImage != null &&
                      item.selectableImage != '')
                    Expanded(
                      flex: widget.isShowCountryCode == true ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8.0),
                        child: Visibility(
                          replacement: Text(
                            item.selectableImage ?? "",
                            style: AppTextStyles.r15
                                .copyWith(color: Colors.grey.shade700),
                          ),
                          visible: item is CountryModel,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10000),
                            child: Container(
                              // borderRadius: BorderRadius.circular(100),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              //toDo: remove commit
                              // child: CachedNetworkImage(
                              //   width: 35,
                              //   height: 35,
                              //   imageUrl: item.selectableImage ?? "",
                              //   placeholder: (c, s) {
                              //     return shimmerImage(
                              //       context: context,
                              //       height: 35,
                              //     );
                              //   },
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      onPressed: () {
        logger.w("message");
        Get.back(result: item);
      },
    );

    // return GestureDetector(
    //   onTap: () {
    //     logger.w("message");
    //     Get.back(result: item);
    //   },
    //   child: Padding(
    //     padding: const EdgeInsetsDirectional.only(
    //       start: 8.0,
    //       end: 8.0,
    //       top: 10,
    //       bottom: 0,
    //     ),
    //     child: CustomCard(
    //       color: Colors.white,
    //       elevation: 0,
    //       child: CustomCard(
    //         elevation: 0,
    //         color: (widget.currentItem != null)
    //             ? checked
    //             ? Colors.grey.shade200
    //             : Colors.white
    //             : Colors.white,
    //         child: Padding(
    //           padding: EdgeInsets.all(
    //             (widget.currentItem != null)
    //                 ? checked
    //                 ? listToShow.length <= 5
    //                 ? 12
    //                 : 10.0
    //                 : listToShow.length <= 5
    //                 ? 12
    //                 : 8
    //                 : listToShow.length <= 5
    //                 ? 12
    //                 : 8,
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               if (item.selectableCountryCode != null &&
    //                   item.selectableCountryCode != '' &&
    //                   widget.isShowCountryCode == true)
    //                 Expanded(
    //                   flex: widget.isShowCountryCode == true ? 1 : 0,
    //                   child: Padding(
    //                     padding: const EdgeInsetsDirectional.only(start: 8.0),
    //                     child: AutoSizeText(
    //                       item.selectableCountryCode.toString(),
    //                       maxFontSize: 14,
    //                       textAlign: TextAlign.start,
    //                       overflow: TextOverflow.ellipsis,
    //                       minFontSize: 12,
    //                       style: AppTextStyles.r14.copyWith(
    //                         color: Colors.grey.shade800,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               Expanded(
    //                 flex: widget.isShowCountryCode == true ? 4 : 1,
    //                 child: Padding(
    //                   padding: const EdgeInsetsDirectional.only(start: 8.0),
    //                   child: AutoSizeText(
    //                     item.selectableName,
    //                     maxFontSize: 14,
    //                     textAlign: widget.isShowCountryCode == true
    //                         ? TextAlign.center
    //                         : TextAlign.start,
    //                     overflow: TextOverflow.ellipsis,
    //                     minFontSize: 12,
    //                     style: AppTextStyles.r14.copyWith(
    //                       color: Colors.grey.shade800,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               if (item.selectableImage != null &&
    //                   item.selectableImage != '')
    //                 Expanded(
    //                   flex: widget.isShowCountryCode == true ? 1 : 0,
    //                   child: Padding(
    //                     padding: const EdgeInsetsDirectional.only(end: 8.0),
    //                     child: Visibility(
    //                       replacement: Text(
    //                         item.selectableImage ?? "",
    //                         style: AppTextStyles.r15
    //                             .copyWith(color: Colors.grey.shade700),
    //                       ),
    //                         visible:item is CountryModel,
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(10000),
    //                         child: Container(
    //                           // borderRadius: BorderRadius.circular(100),
    //                           decoration: const BoxDecoration(
    //                             shape: BoxShape.circle,
    //                           ),
    //                           //toDo: remove commit
    //                           // child: CachedNetworkImage(
    //                           //   width: 35,
    //                           //   height: 35,
    //                           //   imageUrl: item.selectableImage ?? "",
    //                           //   placeholder: (c, s) {
    //                           //     return shimmerImage(
    //                           //       context: context,
    //                           //       height: 35,
    //                           //     );
    //                           //   },
    //                           // ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget shimmerImage({required BuildContext context, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
