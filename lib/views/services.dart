import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

_launchURL() async {
  final Uri url = Uri.parse('tel:+17544570374');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class _ServicesViewState extends State<ServicesView> {
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
            text: "Our Services",
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
        )),
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
