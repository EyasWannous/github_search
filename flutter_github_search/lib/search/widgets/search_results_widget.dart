import 'package:common_github_search/common_github_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_search/search/cubit/search_cubit.dart';
import 'package:flutter_github_search/search/widgets/widgets.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key, required this.items});

  final List<SearchResultItem> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (_, state) {
        return ListView.builder(
          controller: context.read<SearchCubit>().resultScrollController,
          itemCount: items.length,
          // itemCount: items.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == items.length - 1) {
              if (state.endOfSearch) {
                return SearchResultItemWidget(item: items[index]);
              }

              return Column(
                children: [
                  SearchResultItemWidget(item: items[index]),
                  const Center(child: RefreshProgressIndicator()),
                ],
              );
              // return RefreshIndicator(
              //   onRefresh: context.read<SearchCubit>().onRefresh,
              //   child: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // );
            }
            return SearchResultItemWidget(item: items[index]);
          },
        );
      },
    );
  }
}
