import 'package:bloc/bloc.dart';
import 'package:common_github_search/common_github_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_search/simple_bloc_observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  final githubRepository = GithubRepository(GithubCache(), GithubClient());
  runApp(App(githubRepository: githubRepository));
}
