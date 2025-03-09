import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../widgets/app_text.dart';

class ArticleContentScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String authorImage;
  final String authorName;
  final String date;
  final String content;
  const ArticleContentScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.authorImage,
      required this.authorName,
      required this.date,
      required this.content});

  @override
  State<ArticleContentScreen> createState() => _ArticleContentScreenState();
}

class _ArticleContentScreenState extends State<ArticleContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfbfaff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 45.w,
                width: 45.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.color1.withValues(alpha: 0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(Icons.arrow_back, color: AppColor.color1),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Container(
              height: 45.w,
              width: 45.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 66, 117, 183)
                        .withValues(alpha: 0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.share, color: AppColor.color1),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Container(
              height: 250.h,
              width: 423.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.grey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 20.h,
              ),
              child: Column(
                spacing: 15.h,
                children: [
                  AppText(
                    text: widget.title,
                    size: 20.sp,
                    lineHeight: 1.4,
                    maxLine: 3,
                    color: AppColor.title,
                    weight: FontWeight.w600,
                    family: "Poppins",
                    alignment: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 10.w,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundColor: AppColor.color2,
                            backgroundImage: NetworkImage(
                              'https://api.dicebear.com/7.x/adventurer/png?seed=random-seed',
                            ),
                          ),
                          AppText(
                            text: widget.authorName,
                            size: 18.sp,
                            color: AppColor.color2,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Flexible(
                        child: AppText(
                          text: widget.date,
                          size: 18.sp,
                          color: AppColor.color2,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  AppText(
                    text: widget.content,
                    //color: AppColor.color1,
                    size: 18.sp,
                    weight: FontWeight.w500,
                    maxLine: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
