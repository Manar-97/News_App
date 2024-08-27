import 'package:flutter/material.dart';
import 'package:news_app/UI/screens/home/tabs/tabs_list_tab/news_item.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/model/source_response.dart';
import '../../../../../data/api/api_manager.dart';
import '../../../../../data/model/article.dart';
import '../../../../../data/model/article_response.dart';
import '../../../../widgets/error_view.dart';
import '../../../../widgets/loading_view.dart';
import 'news_details.dart';

class NewsList extends StatefulWidget {
  Source source;
  NewsList({super.key, required this.source});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  late Article selectedArticle;
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
        future: ApiManager.getArticle(widget.source.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(
                error: snapshot.error.toString(), onRetryClick: () {});
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){
                        selectedArticle = snapshot.data!.articles![index];
                        Navigator.pushNamed(context, NewsDetails.routeName,
                            arguments: selectedArticle);
                      },
                      child: NewsItem(
                          article: snapshot.data!.articles![index]),
                    ));
          } else {
            return const LoadingView();
          }
        });
  }
}
