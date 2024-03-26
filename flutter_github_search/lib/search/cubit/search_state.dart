part of 'search_cubit.dart';

final class SearchState extends Equatable {
  const SearchState({
    required this.text,
    required this.pageNumber,
    this.endOfSearch = false,
  });

  SearchState copyWith({
    String? text,
    int? pageNumber,
    bool? endOfSearch,
  }) {
    return SearchState(
      text: text ?? this.text,
      pageNumber: pageNumber ?? this.pageNumber,
      endOfSearch: endOfSearch ?? this.endOfSearch,
    );
  }

  final String text;
  final int pageNumber;
  final bool endOfSearch;

  @override
  List<Object?> get props => [text, pageNumber, endOfSearch];
}
