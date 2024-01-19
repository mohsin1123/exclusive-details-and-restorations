import 'package:carousel_slider/carousel_slider.dart';
import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  final urlImages = [
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-15.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-16.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-33.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-34.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-35.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/Exclusiv.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-32.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/WhatsApp-Image-203-07-05-at-09.40.15.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/WhatsApp-Image-223-05-21-at-01.54.01-.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/34177646_619791496292635_420307693902326386_n.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-17.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-13.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-14.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/WhatsApp-Image-2023-0212-at-21.29.36.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/WhatsApp-Image-202-04-02-at-14.21.27.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/29087814_2346117885561856_5000502076490635874_n.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/47396316_760408402226734_1896303380860913908_n.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-22.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-8.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-23.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-29.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-20.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-24.jpg",
    "https://exclusive-details.com/wp-content/uploads/2023/10/BEFORE-30.jpg",
  ];
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
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CustomText(
                text: "Our Work in Pictures",
                color: Colors.white,
                size: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: CarouselSlider.builder(
                itemCount: urlImages.length,
                options: CarouselOptions(
                    height: 400, autoPlay: true, viewportFraction: 2.0),
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
