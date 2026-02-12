import 'package:flutter/material.dart';
import 'package:wesal/features/search/persentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SearchViewBody(),
    );
  }
}
