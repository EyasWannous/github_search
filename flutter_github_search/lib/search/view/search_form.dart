import 'package:common_github_search/common_github_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_search/search/cubit/search_cubit.dart';
import 'package:flutter_github_search/search/widgets/widgets.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(
        context.read<GithubSearchBloc>(),
        ScrollController(),
        TextEditingController(),
      ),
      child: const Column(
        children: [
          SearchBarWidget(),
          SearchBodyListWidget(),
        ],
      ),
    );
  }
}
