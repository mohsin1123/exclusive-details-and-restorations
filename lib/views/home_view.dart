import 'package:carousel_slider/carousel_slider.dart';
import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:exclusive_details_and_restorations/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

_launchURL() async {
  final Uri url = Uri.parse('tel:+17544570374');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

var scaffoldkey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromRGBO(0, 40, 70, 100),
            Colors.red.shade900,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
        key: scaffoldkey,
        drawer: const MyDrawer(),
        appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
          ),
          backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
          actions: [
            SizedBox(
              width: 100,
              child: Image.asset("assets/images/exclusive-details-rename.png"),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              slider(),
              const SizedBox(
                height: 10,
              ),
              const Center(
                  child: CustomText(
                text: "WELCOME TO EXCLUSIVE DETAILS & RESTORATION LLC",
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              )),
              const Divider(),
              const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10, right: 10),
                child: CustomText(
                  text:
                      "At Exclusive Details & Restorations LLC, we specialize in elevating the aesthetics and preserving the integrity of your vehicles, whether they’re on water, land, or in the sky. Our expert team is dedicated to providing top-tier detailing services for boats, cars, and aircraft, ensuring they shine like new.",
                  size: 15,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              )),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: contactButton(
                      "Get in touch ➜", Colors.red.shade700, Colors.white)),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const Center(
                  child: CustomText(
                text: "Why Choose Exclusive Details & Restorations LLC?",
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  circleContainer(
                      FontAwesomeIcons.thumbsUp, "CONVENIENCE & FLEXIBILITY"),
                  circleContainer(FontAwesomeIcons.productHunt,
                      "ECO-FRIENDLY QUALITY PRODUCTS")
                ],
              ).animate().slide(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  circleContainer(FontAwesomeIcons.brain,
                      "PEACE OF MIND                          "),
                  circleContainer(FontAwesomeIcons.personCircleCheck,
                      "100% SATISFACTION GUARANTEED")
                ],
              ).animate().slide(),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: CustomText(
                text: "Our Services",
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/boat.jpg"),
                ),
              ),
              servicesWidget("1. Boat Detailing",
                  "Revitalize your boat’s appearance with our boat detailing services, from polishing to ceramic coating."),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/Aircraft.jpg"),
                ),
              ),
              servicesWidget("2. Aircraft Detailing",
                  "Elevate the beauty and functionality of your aircraft with our aircraft detailing services."),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/car.jpg"),
                ),
              ),
              servicesWidget("3. Car Detailing",
                  "Experience automotive excellence with our car detailing, including ceramic coating for lasting protection."),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider() {
    return CarouselSlider(
        items: [
          "Professional Boat Detailing Services in Florida",
          "Professional Car Detailing Services in Florida",
          "Professional Aircraft Detailing Services in Florida"
        ].map((e) {
          return Container(
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.fill,
                image: AssetImage("assets/images/revslider_3.jpeg"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CustomText(
                  text: e,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 25,
                  textAlign: TextAlign.center,
                )
                        .animate()
                        .fade()
                        .slideY(duration: const Duration(milliseconds: 500))),
                contactButton("Call now ➢", Colors.red.shade700, Colors.white)
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 250,
          aspectRatio: 16 / 9,
          enableInfiniteScroll: true,
          autoPlay: true,
          viewportFraction: 1,
        ));
  }

  Widget contactButton(String text, Color color, Color bgColor) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(bgColor)),
        onPressed: _launchURL,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: text,
            size: 20,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget circleContainer(IconData icon, String text) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.red.shade900,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomText(
          text: text,
          color: Colors.white,
          size: 10,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget servicesWidget(String serviceName, String serviceDescription) {
    return Column(
      children: [
        CustomText(
          text: serviceName,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        const SizedBox(height: 10),
        CustomText(
          text: serviceDescription,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        contactButton("Get a free quote ➜", Colors.white, Colors.black)
      ],
    );
  }
}
