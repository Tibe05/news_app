import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import 'app_text.dart';

class CategoryTab extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryTab({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add functionality here
        // setState(() {
        //   isSelected = !isSelected;
        // });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: Column(
          children: [
            Container(
              height: 5.h,
              width: 5.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.color1 : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
            AppText(
              text: title,
              size: 22.sp,
              color: isSelected ? AppColor.color1 : AppColor.color2,
            ),
          ],
        ),
      ),
    );
  }
}