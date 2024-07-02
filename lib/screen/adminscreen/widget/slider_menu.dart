import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderMenu extends StatefulWidget {
  const SliderMenu({super.key});

  @override
  State<SliderMenu> createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 290.0, // tinggi card slide
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: [
            'https://www.yamaha-motor.co.id/uploads/products/featured_image/2023102519190474792T91675.png',
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//95/MTA-71376340/yamaha_yamaha_full01.jpg',
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//101/MTA-62683319/yamaha_yamaha-mx-king-150_full00_62428B5E-9473-49B5-B2E3-532C4039BF1E.jpg',
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  margin: EdgeInsets.all(5),
                  elevation: 5,
                  child: Container(
                    width: 450, // lebar card slide
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(i),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
