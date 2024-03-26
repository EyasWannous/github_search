import 'dart:async';

import 'package:common_github_search/common_github_search.dart';

class GithubRepository {
  const GithubRepository(this.cache, this.client);

  final GithubCache cache;
  final GithubClient client;

  Future<SearchResult> search(String term, String pageNumber) async {
    final cachedResult = cache.get('${term}${pageNumber}');
    if (cachedResult != null) return cachedResult;

    final result = await client.search(term, pageNumber);
    cache.set('${term}${pageNumber}', result);
    return result;
  }
}
