import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:flutter/material.dart';

class ServiceAreasView extends StatefulWidget {
  const ServiceAreasView({super.key});

  @override
  State<ServiceAreasView> createState() => _ServiceAreasViewState();
}

class _ServiceAreasViewState extends State<ServiceAreasView> {
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
            text: "Service Areas",
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CustomText(
                text: "Our Service Areas are listed Below",
                color: Colors.white,
                size: 20,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
            singleserviceArea(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Miamimetroarea.jpg/800px-Miamimetroarea.jpg",
                "Miami, FL"),
            singleserviceArea(
                "https://upload.wikimedia.org/wikipedia/commons/5/59/Lake_Eola_Park_in_Orlando_02.jpg",
                "Orlando, FL"),
            singleserviceArea(
                "https://upload.wikimedia.org/wikipedia/commons/5/5d/Skyline_of_Fort_Lauderdale%2C_Nov-15.jpg",
                "Fort Lauderdale, FL"),
            singleserviceArea(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/West_Palm_Beach_Aerial_November_2014_photo_D_Ramey_Logan.jpg/1200px-West_Palm_Beach_Aerial_November_2014_photo_D_Ramey_Logan.jpg",
                "West Palm Beach, FL"),
            singleserviceArea(
                "https://www.worldatlas.com/r/w1200-q80/upload/85/e8/f9/shutterstock-1125561809.jpg",
                "Port St. Lucie, FL"),
            singleserviceArea(
                "https://upload.wikimedia.org/wikipedia/commons/4/46/Coral_Gables_skyline_20100403.jpg",
                "Coral Gables"),
            singleserviceArea(
                "https://upload.wikimedia.org/wikipedia/commons/7/77/Bayside_www.florida-infos.com_-_panoramio_%281%29.jpg",
                "Naples")
          ],
        )),
      ),
    );
  }

  Widget singleserviceArea(String img, String city) {
    return Column(
      children: [
        Center(
            child: Image.network(
          img,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )),
        CustomText(
          text: city,
          color: Colors.white,
          size: 15,
          fontWeight: FontWeight.w600,
        ),
        const Divider()
      ],
    );
  }
}
