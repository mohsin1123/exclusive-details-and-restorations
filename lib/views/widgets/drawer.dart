import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });
  _launchURL() async {
    final Uri url = Uri.parse('tel:+17544570374');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromRGBO(0, 40, 70, 100),
            Colors.yellow.shade400,
          ],
        ),
      ),
      child: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,
                          child: Image.asset(
                            "assets/images/exclusive-details-rename.png",
                          )),
                      const SizedBox(height: 10),
                      const CustomText(
                        // Display user's name here
                        text: 'Exclusive Details & Restoration',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Home",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () => Get.toNamed("home"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "About",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () => Get.toNamed("about"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.cleaning_services,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Services",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () => Get.toNamed("services"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Shop",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () => Get.toNamed("shop"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.browse_gallery,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Gallery",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () => Get.toNamed("gallery"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Service Areas",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () => Get.toNamed("serviceAreas"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.contact_mail,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Contact",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: _launchURL,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Cart",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () {
                    Get.toNamed("cart");
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.rate_review,
                    color: Colors.white,
                  ),
                  title: const CustomText(
                    text: "Rate us",
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 16,
                  ),
                  onTap: () => LaunchReview.launch(writeReview: false),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text:
                        "Copyright © 2023 Exclusive Details & Restorations. All Rights Reserved.",
                    size: 12,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
