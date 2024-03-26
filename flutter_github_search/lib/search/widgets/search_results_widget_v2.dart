// import 'package:common_github_search/common_github_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_github_search/search/widgets/widgets.dart';
// import 'package:future_list/future_list_builder.dart';
// import 'package:future_list/shimmer_card.dart';

// class SearchResultsWidgetV2 extends StatelessWidget {
//   const SearchResultsWidgetV2({super.key, required this.items});

//   final List<SearchResultItem> items;

//   @override
//   Widget build(BuildContext context) {
//     return FutureListBuilder(
//       url: "https://example.com/get/locations",
//       httpMethod: HttpMethod.get,
//       converter: Location.fromJson,
//       itemBuilder: (BuildContext context, int index) {
//         return SearchResultItemWidget(item: items[index]);
//       },
//       dataPath: const ['data'],
//       countPath: const ['total_count'],
//       shimmerBuilder: () =>
//           const ShimmerCard(width: 1, height: 100, fillWidth: true),
//       pagination: true,
//       onError: (errorMessage) {
//         print("Error: $errorMessage");
//       },
//     );
//   }
// }
