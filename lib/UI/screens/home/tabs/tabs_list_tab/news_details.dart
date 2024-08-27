import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/UI/screens/home/tabs/tabs_list_tab/web.dart';
import '../../../../../data/model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../utils/app_colors.dart';


class NewsDetails extends StatelessWidget {
  static const String routeName = "news_details";
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article args = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.085,
        backgroundColor: AppColors.appBar,
        title: Text(
          "News Title",
          style: GoogleFonts.getFont(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
              "Exo"),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: args.urlToImage ?? "",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.network(
                      "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                args.source?.name ?? "",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff79828B),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                args.title ?? "",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff42505C)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                formatTimeAgo(args.publishedAt ?? ""),
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff79828B),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                args.content ?? "",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewScreen.routeName,
                      arguments: args.url);
                },
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text(
                      "View Full Article ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF42505C),
                      ),
                    ),
                    Icon(Icons.arrow_right,size: 30,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTimeAgo(String dateString) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(dateString);

    // Return the formatted time ago string
    return timeago.format(dateTime);
  }
}
