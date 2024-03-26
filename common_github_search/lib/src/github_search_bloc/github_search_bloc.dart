import 'package:bloc/bloc.dart';
import 'package:common_github_search/common_github_search.dart';
import 'package:stream_transform/stream_transform.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({required this.githubRepository})
      : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  static final _duration = Duration(milliseconds: 300);
  static EventTransformer<Event> debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  final GithubRepository githubRepository;
  List<SearchResultItem> searchResults = [];

  Future<void> _onTextChanged(
    TextChanged event,
    Emitter<GithubSearchState> emit,
  ) async {
    final searchTerm = event.text;
    final pageNumber = event.page;

    if (searchTerm.isEmpty) return emit(SearchStateEmpty());

    if (searchResults.isNotEmpty) {
      emit(SearchStateLoading(searchResults));
    } else {
      emit(SearchStateLoading(null));
    }

    try {
      final results = await githubRepository.search(searchTerm, pageNumber);

      if (pageNumber == '1' || pageNumber == '0') {
        searchResults.clear();
        searchResults.addAll(results.items);
        emit(SearchStateSuccess(results.items));
        return;
      }

      searchResults.addAll(results.items);
      emit(SearchStateSuccess(searchResults));
    } catch (error) {
      emit(
        error is SearchResultError
            ? SearchStateError(error.message)
            : const SearchStateError('something went wrong'),
      );
    }
  }
}
