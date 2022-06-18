import 'package:car_rental/screens/detail.dart';
import 'package:car_rental/screens/rented.dart';
import 'package:flutter/material.dart';

import 'package:car_rental/data/car.dart';
import 'package:car_rental/data/brand.dart';
import 'package:car_rental/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.cars}) : super(key: key);
  final List<Car> cars;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  late List<Brand> brands = [
    Brand(
      name: 'Porsche',
      imageUrl: 'assets/images/porshce.png',
    ),
    Brand(
      name: 'Mercedes',
      imageUrl: 'assets/images/mercedes.png',
    ),
    Brand(
      name: 'Lamborghini',
      imageUrl: 'assets/images/lamborghini.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            // Container(
            //   height: size.height * 0.07,
            //   width: size.width,
            //   margin: const EdgeInsets.fromLTRB(15, 20, 16, 24),
            //   padding: const EdgeInsets.fromLTRB(16, 16, 0, 14),
            //   decoration: BoxDecoration(
            //     color: kShadeColor.withOpacity(0.3),
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: TextField(
            //     controller: searchController,
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       hintText: 'Marka Ara',
            //       hintStyle: kSearchHint,
            //       icon: Image.asset('assets/images/search.png'),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'En Çok Arananlar',
                    style: kSectionTitle,
                  ),
                  // Text(
                  //   'Hepsini Gör',
                  //   style: kViewAll,
                  // ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (ctx, i) {
                return Container(
                  height: size.height * 0.07,
                  width: size.width * 0.35,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  padding: const EdgeInsets.fromLTRB(12, 16, 0, 11),
                  decoration: BoxDecoration(
                    color: kShadeColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        brands[i].imageUrl,
                        scale: 0.9,
                      ),
                      const SizedBox(height: 9),
                      Text(
                        brands[i].name,
                        style: kBrand,
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 24, 15, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Son Kiralanan',
                    style: kSectionTitle,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecentlyRented(
                            item: widget.cars,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Hepsini Gör',
                      style: kViewAll,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.cars.length,
              itemBuilder: (ctx, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          name: widget.cars[i].name,
                          brand: widget.cars[i].brand,
                          imageUrl: widget.cars[i].imageUrl,
                          description: widget.cars[i].description,
                          speed: widget.cars[i].speed,
                          seats: widget.cars[i].seats,
                          engine: widget.cars[i].engine,
                          price: widget.cars[i].price,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width * 0.65,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 11),
                    decoration: BoxDecoration(
                      color: kShadeColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cars[i].name,
                                  style: kBrand,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Image.asset('assets/images/star.png'),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.cars[i].stars,
                                      style: kRate.apply(
                                        color: kTextColor.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: size.width * 0.1,
                              width: size.width * 0.1,
                              decoration: BoxDecoration(
                                color: kShadeColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:
                                  Image.asset('assets/images/active-saved.png'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Hero(
                            tag: widget.cars[i].imageUrl,
                            child: Image.asset(
                              widget.cars[i].imageUrl,
                              scale: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/cost.png'),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Text(
                                  widget.cars[i].price,
                                  style: kPrice,
                                ),
                                Text(
                                  '/Hafta',
                                  style: kPrice.copyWith(
                                    color: kTextColor.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 24, 15, 13),
              child: Text('En İyi Bayiler', style: kSectionTitle),
            ),
            Container(
              width: size.width,
              height: size.height * 0.1,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kShadeColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/kristy.png'),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Garenta", style: kBrand),
                      const SizedBox(height: 3),
                      Text(
                        "Samsun/Atakum",
                        style: kBrand.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
