import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/extensions/date_formatter.dart';
import 'package:news_app/presentation/screens/article_content_screen.dart';
import 'package:news_app/presentation/widgets/app_text.dart';

import '../../data/api/news_api.dart';
import '../../data/models/article.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppText(
            text: "Breaking News",
            size: 52.sp,
            color: AppColor.title,
            weight: FontWeight.w800,
            alignment: TextAlign.start,
          ),
        ),
        FutureBuilder<List<Article>>(
          future: fetchNews(true), // Simulate a network call
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Loading...'));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final article = snapshot.data![0];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleContentScreen(
                          imageUrl: article.image,
                          title: article.title,
                          authorImage: 'https://api.dicebear.com/7.x/adventurer/png?seed=random-seed',
                          authorName: article.authorName,
                          date: article.date.toFormattedDate(),
                          content: article.content),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.color1.withValues(alpha: 0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
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
                            article.image,
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
                              text: article.title,
                              size: 20.sp,
                              lineHeight: 1.4,
                              maxLine: 2,
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
                                      text: article.authorName,
                                      size: 18.sp,
                                      color: AppColor.color2,
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: AppText(
                                    text: article.date.toFormattedDate(),
                                    size: 18.sp,
                                    color: AppColor.color2,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
