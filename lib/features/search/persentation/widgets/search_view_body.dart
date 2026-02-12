import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/features/search/persentation/widgets/cusine_item_widget.dart';
import 'package:wesal/features/search/persentation/widgets/custom_search_text_field.dart';
import 'package:wesal/features/search/persentation/widgets/functions/build_top_search_chip.dart';
import 'package:wesal/features/search/persentation/widgets/functions/popular_cusine_function.dart';
import 'package:wesal/features/search/persentation/widgets/functions/popular_cusine_header.dart';
import 'package:wesal/l10n/app_localizations.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  // Mock data for recent searches (Empty list for new users, populate to test)
  List<String> recentSearches = ['Fried Chicken', 'Pizza'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Search Field
              const CustomSearchTextField(),
              SizedBox(height: 24.h),

              // Recent Searches (Logic: Show if list is not empty)
              if (recentSearches.isNotEmpty) ...[
                sectionHeader(
                  context,
                  AppLocalizations.of(context)!.recentSearches,
                  onDelete: () {
                    setState(() {
                      recentSearches.clear();
                    });
                  },
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: recentSearches.map((search) {
                    return buildTopSearchChip(
                      context,
                      search,
                      Icons.history, // History icon for recent searches
                    );
                  }).toList(),
                ),
                SizedBox(height: 32.h),
              ],

              // Popular Cuisines
              sectionHeader(
                context,
                AppLocalizations.of(context)!.popularCuisines,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 110.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularCuisines(context).length,
                  itemBuilder: (BuildContext context, int index) =>
                      CusineItemWidget(
                        popularCusineModel: popularCuisines(context)[index],
                      ),
                ),
              ),

              SizedBox(height: 32.h),

              // Top Searches (Trending)
              sectionHeader(context, AppLocalizations.of(context)!.topSearches),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  buildTopSearchChip(
                    context,
                    AppLocalizations.of(context)!.burger,
                    Icons.trending_up,
                  ),
                  buildTopSearchChip(
                    context,
                    AppLocalizations.of(context)!.koshary,
                    Icons.trending_up,
                  ),
                  buildTopSearchChip(
                    context,
                    AppLocalizations.of(context)!.shawerma,
                    Icons.trending_up,
                  ),
                  buildTopSearchChip(
                    context,
                    AppLocalizations.of(context)!.pasta,
                    Icons.trending_up,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
