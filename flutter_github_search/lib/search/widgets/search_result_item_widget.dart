import 'package:common_github_search/common_github_search.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultItemWidget extends StatelessWidget {
  const SearchResultItemWidget({super.key, required this.item});

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(
          item.owner.avatarUrl,
          errorBuilder: (context, error, stackTrace) => ClipOval(
            child: Container(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      title: Text(item.fullName),
      onTap: () => launchUrl(Uri.parse(item.htmlUrl)),
    );
  }
}
