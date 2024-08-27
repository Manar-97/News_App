import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../../data/model/article.dart';
import '../../../../widgets/loading_view.dart';
import 'news_details.dart';

class NewsItem extends StatefulWidget {
  Article article;
  NewsItem({required this.article, super.key});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: widget.article.urlToImage ?? "",
                  placeholder: (context, url) => const LoadingView(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: MediaQuery.of(context).size.height * .25,
                ),
              ),
              const SizedBox(height: 8),
              Text(widget.article.source?.name ?? "",
                  style: GoogleFonts.getFont("Poppins",
                      color: const Color(0xFF79828B), fontSize: 10)),
              Text(widget.article.title ?? "",
                  style: GoogleFonts.getFont("Poppins",
                      color: const Color(0xFF42505C),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  formatTimeAgo(widget.article.publishedAt ?? ""),
                  style: GoogleFonts.getFont("Inter",
                      color: const Color(0xFFA3A3A3), fontSize: 13),
                ),
              ),
              const SizedBox(height: 10),
            ],
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