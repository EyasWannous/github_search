import 'package:common_github_search/common_github_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets.dart';

class SearchBodyListWidget extends StatelessWidget {
  const SearchBodyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (_, state) {
        return switch (state) {
          SearchStateEmpty() => const Text('Please enter a term to begin'),
          SearchStateLoading() => onSearchStateLoading(state.items),
          SearchStateError() => Text(state.error),
          SearchStateSuccess() => onSearchStateSuccess(state.items),
        };
      },
    );
  }

  Widget onSearchStateLoading(List<SearchResultItem>? items) {
    if (items == null || items.isEmpty) {
      return const CircularProgressIndicator.adaptive();
    }

    return Expanded(child: SearchResultsWidget(items: items));
  }

  Widget onSearchStateSuccess(List<SearchResultItem> items) {
    if (items.isEmpty) return const Text('No Results');

    return Expanded(child: SearchResultsWidget(items: items));
  }
}
