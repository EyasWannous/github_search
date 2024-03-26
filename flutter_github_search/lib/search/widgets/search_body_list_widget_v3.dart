import 'package:common_github_search/common_github_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_search/search/widgets/search_results_widget.dart';

class SearchBodyListWidgetV3 extends StatelessWidget {
  const SearchBodyListWidgetV3({required this.items, super.key});
  final List<SearchResultItem> items;

  @override
  Widget build(BuildContext context) {
    return SearchResultsWidget(items: items);
  }
}
