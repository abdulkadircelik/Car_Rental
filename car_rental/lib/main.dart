import 'package:car_rental/constant.dart';
import 'package:car_rental/data/car.dart';
import 'package:car_rental/http/api.dart';
import 'package:car_rental/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Araba Kiralama Uygulaması',
      theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor),
      home: const LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
    loader();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          value: controller.value,
        ),
      ),
    );
  }

  void loader() async {
    List<Car> cars = await getCars();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen(cars: cars)));
  }
}
