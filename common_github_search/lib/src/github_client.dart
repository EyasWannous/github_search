import 'dart:async';
import 'dart:convert';

import 'package:common_github_search/common_github_search.dart';
import 'package:http/http.dart' as http;

class GithubClient {
  GithubClient({
    http.Client? httpClient,
    this.baseUrl = 'https://api.github.com/search/repositories?q=',
  }) : httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client httpClient;

  Future<SearchResult> search(String term, String pageNumber) async {
    final queryParameters =
        '${term}&sort=stars&order=desc&page=${pageNumber}&per_page=15';
    final githubSearchRequest = Uri.parse('${baseUrl}${queryParameters}');

    final response = await httpClient.get(githubSearchRequest);
    final results = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}
