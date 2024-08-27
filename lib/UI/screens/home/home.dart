import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/UI/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/UI/screens/home/tabs/settings/settings.dart';
import 'package:news_app/UI/screens/home/tabs/tabs_list_tab/tabs_list.dart';
import 'package:news_app/UI/utils/app_colors.dart';
import 'package:news_app/UI/widgets/search.dart';
import '../../../data/model/category.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> searchResults = [];
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  late Widget currentBody;
  @override
  void initState() {
    super.initState();
    currentBody = CategoriesTab(onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (currentBody is CategoriesTab) {
            return true;
          } else {
            currentBody = CategoriesTab(onCategoryClick);
            setState(() {});
            return false;
          }
        },
        child: Scaffold(
          appBar: buildAppBar(),
          body: currentBody,
          drawer: buildDrawer(),
        ),
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.085,
        actions: [
          IconButton(
            icon: Icon(
              isSearching ? Icons.close : Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                showSearch(context: context, delegate: CustomSearch());
              });
            },
          ),
        ],
        backgroundColor: AppColors.appBar,
        title: Text(
          "News App",
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
      );

  buildDrawer() => Drawer(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeaderDrawer(),
            buildRowDrawer(Icons.list, "Categories", () {
              currentBody = CategoriesTab(onCategoryClick);
              Navigator.pop(context);
              setState(() {});
            }),
            buildRowDrawer(Icons.settings, "Settings", () {
              currentBody = const SettingsTab();
              Navigator.pop(context);
              setState(() {});
            }),
          ],
        ),
      );

  Container buildHeaderDrawer() => Container(
        height: MediaQuery.of(context).size.height * 0.2,
        color: AppColors.appBar,
        child: Center(
            child: Text(
          "NewsApp!",
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont("Poppins",
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        )),
      );

  void onCategoryClick(Category category) {
    currentBody = TabsList(category.backEndId);
    setState(() {});
  }

  buildRowDrawer(IconData iconData, String title, void Function() onClick) =>
      InkWell(
        onTap: () {
          onClick();
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.getFont(
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    "Poppins"),
              )
            ],
          ),
        ),
      );
}
