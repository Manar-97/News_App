// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../utils/app_colors.dart';

class WebViewScreen extends StatefulWidget {
  static String routeName = "web";
  bool ara = true;

  WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  bool isBuild = false;

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)?.settings.arguments as String;
    if (!isBuild) {
      isBuild = true;
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.disabled)
        ..loadRequest(Uri.parse(argument))
        ..setNavigationDelegate(NavigationDelegate(onPageFinished: (url) {
          widget.ara = false;
          setState(() {});
        }));
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.085,
        backgroundColor: AppColors.appBar,
        title: Text(
          "Web Site",
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
      body: widget.ara
          ? const Center(child: CircularProgressIndicator())
          : WebViewWidget(
        controller: controller,
      ),
    );
  }
}