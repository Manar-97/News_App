// import 'package:flutter/material.dart';
// import 'package:news_app/UI/widgets/error_view.dart';
// import 'package:news_app/UI/widgets/loading_view.dart';
// import 'package:news_app/data/api/api_manager.dart';
// import 'package:news_app/data/model/article_response.dart';
// import 'package:news_app/data/model/source.dart';
//
// import '../screens/home/tabs/tabs_list_tab/news_item.dart';
//
// class ArticleScreen extends StatefulWidget {
//   Source source;
//    ArticleScreen({super.key,  required this.source});
//
//   @override
//   _ArticleScreenState createState() => _ArticleScreenState();
// }
//
// class _ArticleScreenState extends State<ArticleScreen> {
//   int currentPage = 1;
//   bool isLoading = false;
//   bool hasMoreData = true;
//   List<ArticlesResponse> articles = [];
//   final ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(() {
//       if (scrollController.position.pixels ==
//           scrollController.position.maxScrollExtent) {
//         ApiManager.getArticle(widget.source.id!,); // Fetch more articles when reaching the bottom
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Paged Articles'),
//       ),
//       body: FutureBuilder<ArticlesResponse>(
//         future: ApiManager.getArticle(widget.source.id!),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return ErrorView(
//                 error: snapshot.error.toString(),
//                 onRetryClick: () {});
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: snapshot.data!.articles!.length,
//                 itemBuilder: (context,index)=>
//                     NewsItem(article: snapshot.data!.articles![index])
//             );
//             // buildNewsList(snapshot.data!.articles!);
//           } else {
//             return const LoadingView();
//           }
//         },
//       ),
//     );
//   }
// }
