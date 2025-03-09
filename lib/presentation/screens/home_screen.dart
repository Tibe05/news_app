import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/extensions/date_formatter.dart';
import 'package:news_app/presentation/screens/article_content_screen.dart';
import 'package:news_app/presentation/widgets/app_text.dart';
import 'package:news_app/presentation/widgets/article_item.dart';
import 'package:news_app/presentation/widgets/breaking_news.dart';
import 'package:news_app/presentation/widgets/category_tabbar.dart';

import '../../core/constants/app_colors.dart';
import '../../data/api/news_api.dart';
import '../../data/models/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfbfaff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: const Color.fromARGB(255, 115, 164, 230),
              backgroundImage: NetworkImage(
                'https://api.dicebear.com/7.x/adventurer/png?seed=random-seed',
              ),
            ),
            SizedBox(width: 10.w),
            AppText(
              text: "${DateTime.now()}".toFormattedDate(),
              size: 18.sp,
              color: AppColor.color1,
              weight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Icon(Icons.search, color: AppColor.color1),
            // child: Icon(Icons.share, color: AppColor.color1),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              spacing: 24.h,
              children: [
                BreakingNews(),
                CategoryTabbar(),
                FutureBuilder<List<Article>>(
                  future: fetchNews(false),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text('Loading...'));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final articles = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: articles.length > 10 ? 10 : articles.length,
                        itemBuilder: (BuildContext context, int index) {
                          final article = articles[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleContentScreen(
                                    imageUrl: article.image,
                                    title: article.title,
                                    authorImage:
                                        'https://api.dicebear.com/7.x/adventurer/png?seed=random-seed',
                                    authorName: article.authorName,
                                    date: "${article.date}".toFormattedDate(),
                                    content: article.content,
                                  ),
                                ),
                              );
                            },
                            child: ArticleItem(
                              title: article.title,
                              thumbnail: article.image,
                              date: "${article.date}".toFormattedDate(),
                              readTime: "10 min read",
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
