import 'package:common_github_search/common_github_search.dart';

class SearchResult {
  const SearchResult({required this.items, required this.totalCount});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    final totalCount = json['totalCount'] as int;
    final items = (json['items'] as List<dynamic>)
        .map(
          (dynamic item) =>
              SearchResultItem.fromJson(item as Map<String, dynamic>),
        )
        .toList();
    return SearchResult(items: items, totalCount: totalCount);
  }

  factory SearchResult.fromJsonV2(Map<String, dynamic> json) {
    final List<SearchResultItem> searchItems = [];

    final totalCount = json['totalCount'] as int;
    final items = json['items'] as List<dynamic>;
    for (final item in items) {
      searchItems.add(SearchResultItem.fromJson(item));
    }

    return SearchResult(items: searchItems, totalCount: totalCount);
  }

  final List<SearchResultItem> items;
  final int totalCount;
}
