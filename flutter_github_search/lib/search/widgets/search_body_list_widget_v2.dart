import 'package:common_github_search/common_github_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_search/search/widgets/search_results_widget.dart';

class SearchBodyListWidgetV2 extends StatefulWidget {
  const SearchBodyListWidgetV2({super.key});

  @override
  SearchBodyListWidgetV2State createState() => SearchBodyListWidgetV2State();
}

class SearchBodyListWidgetV2State extends State<SearchBodyListWidgetV2> {
  // List<SearchResultItem> _items = [];

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<GithubSearchBloc>().stream.listen((state) {
  //     if (state is SearchStateSuccess) {
  //       setState(() {
  //         _items = state.items;
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   context.read<GithubSearchBloc>().close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final sc = context.select<GithubSearchBloc,SearchStateSuccess>((bloc) => bloc.state);
    final newState = context.watch<GithubSearchBloc>().state;
    return switch (newState) {
      SearchStateEmpty() => const Text('Please enter a term to begin'),
      SearchStateLoading() => const CircularProgressIndicator.adaptive(),
      SearchStateError() => Text(newState.error),
      SearchStateSuccess() => newState.items.isEmpty
          ? const Text('No Results')
          : Expanded(child: SearchResultsWidget(items: newState.items)),
    };
  }
}
