import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'loader_widget.dart';
import '../../configs/fonts.dart';

import '../../configs/project_themes.dart';
import '../../configs/styles.dart';

class CustomFilledButton extends StatelessWidget {
  CustomFilledButton({
    super.key,
    this.labelColor,
    required this.onTap,
    this.backgroundColor,
    this.height,
    this.width = double.infinity,
    this.buttonStatus,
    //TODO:
    this.loadingColor = Colors.white,
    this.useShadow = true,
    required this.child,
  });

  final Color? labelColor;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double? height;
  final double width;
  final Rx<CustomButtonStatus>? buttonStatus;
  final Color loadingColor;
  final dynamic child;
  final bool useShadow;
  final Rx<bool> isHovered = false.obs;
  @override
  Widget build(BuildContext context) {
    if (buttonStatus == null) {
      return Obx(
        () => AnimatedContainer(
          duration: 150.milliseconds,
          padding: isHovered.value
              ? EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w)
              : const EdgeInsets.all(0),
          height: height ?? 58.h,
          width: width,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
            boxShadow: useShadow == true
                ? [
                    BoxShadow(
                      offset: Offset(0.w, 4.h),
                      blurRadius: 12.r,
                      color: Colors.black.withOpacity(.08),
                    ),
                  ]
                : [],
          ),
          child: Material(
            color: backgroundColor ?? Get.theme.colorScheme.primary,
            elevation: 0,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
            child: InkWell(
              onTap: onTap,
              onHover: (value) {
                if (value) {
                  isHovered.value = true;
                } else {
                  isHovered.value = false;
                }
              },
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              child: Center(
                child: buildChild(),
              ),
            ),
          ),
        ),
      );
    }
    return Obx(
      () => AnimatedContainer(
        height: height ?? 58.h,
        width: width,
        duration: 150.milliseconds,
        padding: isHovered.value
            ? EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w)
            : const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.w, 4.h),
              blurRadius: 12.r,
              color: Colors.black.withOpacity(.08),
            ),
          ],
        ),
        child: Material(
          color: backgroundColor ?? Get.theme.colorScheme.primary,
          elevation: 0,
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          child: Obx(
            () {
              switch (buttonStatus!.value) {
                case CustomButtonStatus.enabled:
                  {
                    return InkWell(
                      onTap: onTap,
                      onHover: (value) {
                        if (value) {
                          isHovered.value = true;
                        } else {
                          isHovered.value = false;
                        }
                      },
                      borderRadius: BorderRadius.circular(
                          GlobalStyles.globalBorderRadius),
                      child: Center(
                        child: buildChild(),
                      ),
                    );
                  }
                case CustomButtonStatus.disabled:
                  {
                    return InkWell(
                      borderRadius: BorderRadius.circular(
                          GlobalStyles.globalBorderRadius),
                      child: Center(
                        child: buildChild(),
                      ),
                    );
                  }
                case CustomButtonStatus.processing:
                  {
                    return Center(
                      child: SizedBox.square(
                        dimension: 30.h,
                        child: LoaderWidget(
                          color: loadingColor,
                          size: 30.h,
                        ),
                      ),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }

  buildChild() {
    assert(child is String || child is Widget,
        'Expected a widget or string for the child of the CustomFilledButton');
    if (child is String) {
      return Text(
        child,
        style: TextStyle(
          fontFamily: ProjectFonts.fontFamily,
          fontSize: 17.sp,
          color: labelColor ?? lightColorScheme.primaryContainer,
        ),
      );
    }
    return child;
  }
}

enum CustomButtonStatus { enabled, disabled, processing }

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton({
    super.key,
    this.outlineColor,
    required this.onTap,
    this.height,
    this.width = double.infinity,
    this.buttonStatus,
    this.useShadow = false,
    required this.child,
    this.backgroundColor,
    this.outlineWidth,
  });

  final Color? outlineColor;
  final VoidCallback onTap;
  final double? outlineWidth;
  final Color? backgroundColor;
  final double? height;
  final double width;
  final Rx<CustomButtonStatus>? buttonStatus;
  final dynamic child;
  final bool useShadow;
  final Rx<bool> isHovered = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        height: height ?? 58.h,
        width: width,
        duration: 150.milliseconds,
        padding: isHovered.value
            ? EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w)
            : const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          color: backgroundColor ?? Colors.transparent,
          boxShadow: useShadow == true
              ? [
                  BoxShadow(
                    offset: Offset(0.w, 4.h),
                    blurRadius: 12.r,
                    color: Colors.black.withOpacity(.08),
                  ),
                ]
              : null,
        ),
        child: Material(
            color: Colors.transparent,
            elevation: 0,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(GlobalStyles.globalBorderRadius),
                border: Border.all(
                  color: outlineColor ?? Get.theme.colorScheme.primary,
                  width: outlineWidth ?? 2.w,
                ),
              ),
              child: buttonStatus == null
                  ? InkWell(
                      onTap: onTap,
                      onHover: (value) {
                        if (value) {
                          isHovered.value = true;
                        } else {
                          isHovered.value = false;
                        }
                      },
                      borderRadius: BorderRadius.circular(
                          GlobalStyles.globalBorderRadius),
                      child: Center(
                        child: buildChild(),
                      ),
                    )
                  : Obx(
                      () {
                        switch (buttonStatus!.value) {
                          case CustomButtonStatus.enabled:
                            {
                              return InkWell(
                                onTap: onTap,
                                onHover: (value) {
                                  if (value) {
                                    isHovered.value = true;
                                  } else {
                                    isHovered.value = false;
                                  }
                                },
                                borderRadius: BorderRadius.circular(
                                    GlobalStyles.globalBorderRadius),
                                child: Center(
                                  child: buildChild(),
                                ),
                              );
                            }
                          case CustomButtonStatus.disabled:
                            {
                              return InkWell(
                                borderRadius: BorderRadius.circular(
                                    GlobalStyles.globalBorderRadius),
                                child: Center(
                                  child: buildChild(),
                                ),
                              );
                            }
                          case CustomButtonStatus.processing:
                            {
                              return Center(
                                child: SizedBox.square(
                                  dimension: 30.h,
                                  child: CircularProgressIndicator(
                                    color: outlineColor,
                                    strokeWidth: 4.sp,
                                  ),
                                ),
                              );
                            }
                        }
                      },
                    ),
            )),
      ),
    );
  }

  buildChild() {
    assert(child is String || child is Widget,
        'Expected a widget or string for the child of the ç');
    if (child is String) {
      return Text(
        child,
        style: TextStyle(
          fontFamily: ProjectFonts.fontFamily,
          fontSize: 17.sp,
          color: outlineColor ?? lightColorScheme.primary,
        ),
      );
    }
    return child;
  }
}

class CustomTintedButton extends StatelessWidget {
  const CustomTintedButton({
    super.key,
    this.foregroundColor,
    required this.onTap,
    this.height,
    this.width = double.infinity,
    this.buttonStatus,
    this.useShadow = false,
    required this.child,
    this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final double? height;
  final double width;
  final Rx<CustomButtonStatus>? buttonStatus;
  final bool useShadow;
  final dynamic child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 58.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        color: backgroundColor ?? Get.theme.colorScheme.primaryContainer,
        boxShadow: useShadow == true
            ? [
                BoxShadow(
                  offset: Offset(0.w, 4.h),
                  blurRadius: 12.r,
                  color: Colors.black.withOpacity(.08),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: buttonStatus == null
            ? InkWell(
                onTap: onTap,
                borderRadius:
                    BorderRadius.circular(GlobalStyles.globalBorderRadius),
                child: Center(
                  child: buildChild(),
                ),
              )
            : Obx(
                () {
                  switch (buttonStatus!.value) {
                    case CustomButtonStatus.enabled:
                      {
                        return InkWell(
                          onTap: onTap,
                          borderRadius: BorderRadius.circular(
                              GlobalStyles.globalBorderRadius),
                          child: Center(
                            child: buildChild(),
                          ),
                        );
                      }
                    case CustomButtonStatus.disabled:
                      {
                        return InkWell(
                          borderRadius: BorderRadius.circular(
                              GlobalStyles.globalBorderRadius),
                          child: Center(
                            child: buildChild(),
                          ),
                        );
                      }
                    case CustomButtonStatus.processing:
                      {
                        return Center(
                          child: SizedBox.square(
                            dimension: 30.h,
                            child: CircularProgressIndicator(
                              color: foregroundColor,
                              strokeWidth: 4.sp,
                            ),
                          ),
                        );
                      }
                  }
                },
              ),
      ),
    );
  }

  buildChild() {
    assert(child is String || child is Widget,
        'Expected a widget or string for the child of the callToActionButton');
    if (child is String) {
      return Text(
        child,
        style: TextStyle(
          fontFamily: ProjectFonts.fontFamily,
          fontSize: 17.sp,
          color: foregroundColor ?? lightColorScheme.primary,
        ),
      );
    }
    return child;
  }
}
