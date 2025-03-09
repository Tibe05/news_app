import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/presentation/widgets/app_text.dart';

class ArticleItem extends StatefulWidget {
  final String title;
  final String thumbnail;
  final String date;
  final String readTime;
  const ArticleItem({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.date,
    required this.readTime,
  });

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(bottom: 25.h),
      child: Row(
        spacing: 10.h,
        children: [
          Container(
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.grey,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                widget.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: widget.title,
                    size: 16.sp,
                    family: "Poppins",
                    color: AppColor.title,
                    weight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 15.sp,
                        color: AppColor.color2,
                      ),
                      SizedBox(width: 5.w),
                      AppText(
                        text: widget.date,
                        size: 15.sp,
                        weight: FontWeight.w600,
                        color: AppColor.color2,
                      ),
                      Spacer(),
                      Icon(
                        Icons.access_time_rounded,
                        size: 15.sp,
                        color: AppColor.color2,
                      ),
                      SizedBox(width: 5.w),
                      AppText(
                        text: widget.readTime,
                        size: 15.sp,
                        weight: FontWeight.w600,
                        color: AppColor.color2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
