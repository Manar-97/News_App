import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});
  static const String routeName = "settings";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "Language",
              style: GoogleFonts.poppins(
                  fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * .70,
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(25.0),
                                child: Text(
                                  "English",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 28.0),
                                child: Text(
                                  "Arabic",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "English",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
