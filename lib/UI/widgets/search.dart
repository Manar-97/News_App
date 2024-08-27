import 'package:flutter/material.dart';
import 'package:news_app/UI/screens/home/tabs/tabs_list_tab/news_item.dart';
import 'package:news_app/UI/widgets/error_view.dart';
import 'package:news_app/UI/widgets/loading_view.dart';
import 'package:news_app/data/model/article_response.dart';
import '../../data/api/api_manager.dart';
import '../screens/home/tabs/tabs_list_tab/news_details.dart';

class CustomSearch extends SearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('Search Article');
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
        future: ApiManager.searchArticles(query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(
                error: snapshot.error.toString(), onRetryClick: () {});
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, NewsDetails.routeName);
                  },
                    child: NewsItem(article: snapshot.data!.articles![index])));
            // buildNewsList(snapshot.data!.articles!);
          } else {
            return const LoadingView();
          }
        });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query.isEmpty ? close(context, null) : query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }
}
