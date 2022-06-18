import 'dart:convert';
import 'dart:io';

import 'package:car_rental/data/car.dart';

Future<List<Car>> getCars() async {
  HttpClient httpClient = HttpClient();
  HttpClientRequest req = await httpClient
      .getUrl(Uri.parse("https://fatihmehmetdeveci.com.tr/cars"));
  HttpClientResponse resp = await req.close();
  String jsonStr = await utf8.decodeStream(resp);
  dynamic jsonDyn = json.decode(jsonStr);
  List<Car> cars = [];
  for (var item in jsonDyn["cars"]) {
    cars.add(Car(
        name: item["name"],
        brand: item["brand"],
        imageUrl: item["imageUrl"],
        description: item["description"],
        speed: item["speed"],
        seats: item["seats"],
        engine: item["engine"],
        stars: item["stars"],
        price: item["price"],
        date: item["date"],
        duration: item["duration"]));
  }
  return cars;
}
