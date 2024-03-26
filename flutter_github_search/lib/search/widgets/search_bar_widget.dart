import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_search/search/cubit/search_cubit.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().textController,
      autocorrect: false,
      onChanged: (text) => context.read<SearchCubit>().onSearch(text, 1),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: context.read<SearchCubit>().onClearTapped,
          child: const Icon(Icons.clear),
        ),
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }
}
