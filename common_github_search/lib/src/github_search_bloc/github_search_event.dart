import 'package:equatable/equatable.dart';

sealed class GithubSearchEvent extends Equatable {
  const GithubSearchEvent();
}

final class TextChanged extends GithubSearchEvent {
  const TextChanged({required this.text, required this.page});

  final String text;
  final String page;

  @override
  List<Object> get props => [text, page];

  @override
  String toString() => 'TextChanged { text: $text, page: $page }';
}
