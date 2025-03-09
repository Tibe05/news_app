import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_tab.dart';

class CategoryTabbar extends StatefulWidget {
  const CategoryTabbar({super.key});

  @override
  State<CategoryTabbar> createState() => _CategoryTabbarState();
}

class _CategoryTabbarState extends State<CategoryTabbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const CategoryTab(
              title: 'All',
              isSelected: true,
            ),
            const CategoryTab(
              title: 'Business',
              isSelected: false,
            ),
            const CategoryTab(
              title: 'Technology',
              isSelected: false,
            ),
            const CategoryTab(
              title: 'Health',
              isSelected: false,
            ),
            const CategoryTab(
              title: 'Sports',
              isSelected: false,
            ),
            const CategoryTab(
              title: 'Media',
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}
