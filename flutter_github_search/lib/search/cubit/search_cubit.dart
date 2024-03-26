import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common_github_search/common_github_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
      this._githubSearchBloc, this.resultScrollController, this.textController)
      : super(const SearchState(text: '', pageNumber: 0)) {
    // _githubSubscription = _githubSearchBloc.stream.listen((event) {
    //   var lastStateIsSuccess = lastState is SearchStateSuccess;
    //   var lastStateIsLoading = lastState is SearchStateLoading;
    //   var lastStateIsSuccessOrLoading =
    //       (lastStateIsSuccess || lastStateIsLoading);
    //   var eventIsSuccess = event is SearchStateSuccess;
    //   var eventIsLoading = event is SearchStateLoading;
    //   var eventIsSuccessOrLoading = (eventIsSuccess || eventIsLoading);

    //   if (lastState != null &&
    //       lastStateIsSuccessOrLoading &&
    //       eventIsSuccessOrLoading) {
    //     var lastStateSuccess = lastState as SearchStateSuccess;
    //     var lastStateLoading = lastState as SearchStateLoading;
    //     var eventSuccess = event as SearchStateSuccess;
    //     var eventLoading = event as SearchStateLoading;

    //     if (lastStateSuccess.items.length == eventSuccess.items.length ||
    //         lastStateSuccess.items.length == eventLoading.items?.length) {
    //       // endOfSearch();
    //     }

    //     if (lastStateLoading.items?.length == eventSuccess.items.length ||
    //         lastStateLoading.items?.length == eventLoading.items?.length) {
    //       // endOfSearch();
    //     }
    //   }

    //   if (eventIsSuccessOrLoading) {
    //     lastState = event;
    //   }
    // });

    resultScrollController.addListener(() {
      bool hasClients = (resultScrollController.hasClients);
      bool isEnd = (resultScrollController.position.maxScrollExtent ==
          resultScrollController.position.pixels);
      bool isNewEnd = (resultScrollController.position.maxScrollExtent !=
          lastPixelsPosition);
      if (hasClients && isEnd && isNewEnd) {
        lastPixelsPosition = resultScrollController.position.pixels;
        onSearch(state.text, state.pageNumber + 1);
      }
    });
  }

  @override
  Future<void> close() {
    resultScrollController.dispose();
    _githubSubscription?.cancel();
    return super.close();
  }

  double lastPixelsPosition = 0;

  StreamSubscription<GithubSearchState>? _githubSubscription;
  GithubSearchState? lastState;

  final GithubSearchBloc _githubSearchBloc;
  final ScrollController resultScrollController;
  final TextEditingController textController;

  Future<void> onSearch(String text, int number) async {
    _githubSearchBloc.add(
      TextChanged(
        text: text,
        page: '$number',
      ),
    );

    emit(state.copyWith(
      text: text,
      pageNumber: number,
      endOfSearch: false,
    ));

    await endOfSearch();
  }

  void onClearTapped() {
    textController.clear();
    onSearch('', 0);
  }

  Future<void> endOfSearch() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () => emit(
        state.copyWith(
          endOfSearch: true,
        ),
      ),
    );

    // emit(
    //   state.copyWith(
    //     endOfSearch: true,
    //   ),
    // );
  }

  // Future<void> onRefresh() async => onSearch(state.text, state.pageNumber + 1);

  // String get searchTerm => '${state.text}${state.pageNumber}';
}
