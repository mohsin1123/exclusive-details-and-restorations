import 'package:countup/countup.dart';
import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

_launchURL() async {
  final Uri url = Uri.parse('tel:+17544570374');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class _AboutViewState extends State<AboutView> {
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
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
          title: const CustomText(
            text: "About",
            color: Colors.white,
          ),
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
              Image.asset("assets/images/team.jpeg"),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: "DETAILING AUTO SERVICES CENTER",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 20,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text:
                      "At Exclusive Details, we’re not just passionate about vehicles; we’re passionate about perfection. Founded with a commitment to deliver the highest standards of detailing craftsmanship, we have become a trusted name in the industry.",
                  color: Colors.grey.shade200,
                  size: 12,
                  textAlign: TextAlign.center,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 300.0),
                    child: Image.asset("assets/images/car_bg.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text:
                          "Our journey began with a simple idea: to provide boat, car, and aircraft owners with a level of detailing service that exceeds expectations. We envisioned a place where vehicles are transformed into works of art, where every detail matters, and where customers experience excellence at every turn.",
                      color: Colors.grey.shade200,
                      size: 12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: "OUR MISSION",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 20,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text:
                      "Our mission is clear: to elevate the aesthetics, preserve the integrity, and enhance the performance of your prized vehicles. We understand that your boat, car, or aircraft is more than just a possession; it’s a reflection of your passion and a symbol of your identity. That’s why we approach each project with unwavering dedication, using the latest technology and premium products to ensure outstanding results.",
                  color: Colors.grey.shade200,
                  size: 12,
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: "EXPERIENCE THE EXCLUSIVE DIFFERENCE",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 20,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text:
                      "Thank you for considering Exclusive Details & Restoration for your detailing needs. We look forward to the opportunity to serve you and your vehicles. Contact us today to schedule an appointment or inquire about our services.",
                  color: Colors.grey.shade200,
                  size: 12,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Countup(
                      suffix: "+",
                      begin: 1,
                      end: 10,
                      duration: const Duration(seconds: 2),
                      separator: ',',
                      style: GoogleFonts.baiJamjuree(
                          fontSize: 20,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const CustomText(
                      text: "YEARS EXPERIENCE \nWORKING",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 12,
                    ),
                    const VerticalDivider(),
                    Countup(
                      suffix: "+",
                      begin: 1,
                      end: 350,
                      duration: const Duration(seconds: 2),
                      separator: ',',
                      style: GoogleFonts.baiJamjuree(
                          fontSize: 20,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const CustomText(
                      text: "CUSTOMERS",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              contactButton("Get a free quote ➜", Colors.white, Colors.black),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
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
}
