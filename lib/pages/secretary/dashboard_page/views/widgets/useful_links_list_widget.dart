// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/controllers/url_helper.dart';
import 'package:shimmer/shimmer.dart';

import 'package:kalam_noor/pages/secretary/dashboard_page/controllers/secretary_dashboard_controller.dart';

import '../../../../../tools/ui_tools/ui_tools.dart';

class UsefulLinksListWidget extends GetView<SecretaryDashboardController> {
  const UsefulLinksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'روابط مفيدة',
          style: ProjectFonts.headlineMedium(),
        ),
        AddVerticalSpacing(value: 15.h),
        Expanded(
          child: Obx(
            () {
              return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                ),
                child: ListView.separated(
                  itemCount: controller.usefulLinks.isEmpty
                      ? 4
                      : controller.usefulLinks.length,
                  padding: EdgeInsets.only(bottom: 25.h, top: 20.h),
                  itemBuilder: (context, index) {
                    return _DashboardContainer(
                      buildChildWithContainer: true,
                      child: controller.usefulLinks.isEmpty
                          ? null
                          : UsefulLinkWidget(
                              link: controller.usefulLinks[index],
                            ),
                    );
                  },
                  separatorBuilder: (context, index) => AddVerticalSpacing(
                    value: 20.h,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class UsefulLinkWidget extends StatelessWidget {
  const UsefulLinkWidget({
    super.key,
    required this.link,
  });
  final UsefulLink link;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(
        Radius.circular(20.r),
      ),
      child: InkWell(
        onTap: () => URLHelper.navigateToLink(link.link),
        hoverColor: Get.theme.colorScheme.primaryContainer.withOpacity(.35),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              link.iconData,
              size: 35.sp,
              color: Get.theme.colorScheme.primary,
            ),
            AddVerticalSpacing(value: 30.h),
            Text(
              link.linkName,
              style: ProjectFonts.titleLarge(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardContainer extends StatelessWidget {
  ///Nullable as to be a placeholder
  final Widget? child;
  final bool buildChildWithContainer;
  const _DashboardContainer({
    this.child,
    this.buildChildWithContainer = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20.r),
      ),
      child: child == null
          ? Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(1),
              highlightColor: Get.theme.scaffoldBackgroundColor,
              direction: ShimmerDirection.rtl,
              child: _buildChild(),
            )
          : buildChildWithContainer == false
              ? child
              : _buildChild(),
    );
  }

  Widget _buildChild() {
    return Container(
      height: 140.h,
      width: double.infinity,
      // padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: child,
    );
  }
}

class UsefulLink {
  String linkName;
  String link;
  IconData iconData;
  UsefulLink({
    required this.linkName,
    required this.link,
    required this.iconData,
  });

  UsefulLink copyWith({
    String? linkName,
    String? link,
    IconData? iconData,
  }) {
    return UsefulLink(
      linkName: linkName ?? this.linkName,
      link: link ?? this.link,
      iconData: iconData ?? this.iconData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'linkName': linkName,
      'link': link,
      'iconData': iconData.codePoint,
    };
  }

  factory UsefulLink.fromMap(Map<String, dynamic> map) {
    return UsefulLink(
      linkName: map['linkName'] as String,
      link: map['link'] as String,
      iconData: IconData(map['iconData'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory UsefulLink.fromJson(String source) =>
      UsefulLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UsefulLinks(linkName: $linkName, link: $link, iconData: $iconData)';

  @override
  bool operator ==(covariant UsefulLink other) {
    if (identical(this, other)) return true;

    return other.linkName == linkName &&
        other.link == link &&
        other.iconData == iconData;
  }

  @override
  int get hashCode => linkName.hashCode ^ link.hashCode ^ iconData.hashCode;
}

List<UsefulLink> usefulLinksList = [
  UsefulLink(
    linkName: 'موقع وزارة التربية',
    link: 'http://moed.gov.sy/site/',
    iconData: FontAwesomeIcons.globe,
  ),
  UsefulLink(
    linkName: 'صفحة وزارة التربية',
    link: 'https://www.facebook.com/Wazara.Altarbea.Official/',
    iconData: FontAwesomeIcons.facebook,
  ),
  UsefulLink(
    linkName: 'حساب وزارة التربية على انستاغرام',
    link: 'https://www.instagram.com/wezart_altarbya_officiall/',
    iconData: FontAwesomeIcons.instagram,
  ),
  UsefulLink(
    linkName: 'موقع مجلس الوزراء',
    link: 'http://www.pministry.gov.sy/',
    iconData: FontAwesomeIcons.globe,
  ),
];
