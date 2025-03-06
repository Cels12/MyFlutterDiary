import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_website/styles/styles.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                width: width,
                height: 56,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResponsiveBreakpoints.of(context).largerThan(TABLET)
                        ? Row(
                          children: [
                            Text('Products', style: getBodyWhite(context)),
                            SizedBox(width: width * 0.02),
                            Text('Cart', style: getBodyWhite(context)),
                            SizedBox(width: width * 0.02),
                            Text('About me', style: getBodyWhite(context)),
                            SizedBox(width: width * 0.02),
                            Text('Favorite', style: getBodyWhite(context)),
                            SizedBox(width: width * 0.02),
                            Text('Setting', style: getBodyWhite(context)),
                          ],
                        )
                        : Icon(Icons.menu_rounded, color: Colors.white),
                    const Icon(Icons.login, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              ResponsiveRowColumn(
                layout:
                    ResponsiveBreakpoints.of(context).largerThan(TABLET)
                        ? ResponsiveRowColumnType.ROW
                        : ResponsiveRowColumnType.COLUMN,
                rowPadding: const EdgeInsets.all(5),
                rowSpacing: 10,
                columnPadding: const EdgeInsets.all(5),
                rowMainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveRowColumnItem(
                    child: ProductWidget(
                      width: width,
                      name: 'HELL NAW',
                      image: 'assets/img/hell_naw.jpg',
                      desc: 'You aint getting this one lil bro',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ProductWidget(
                      width: width,
                      name: 'Kelas King',
                      image: 'assets/img/kelas_king.jpg',
                      desc: 'King mang beda',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ProductWidget(
                      width: width,
                      name: 'Lamia',
                      image: 'assets/img/Lamia.jpg',
                      desc: 'Lamia',
                    ),
                  ),
                ],
              ),
              ResponsiveRowColumn(
                layout:
                    ResponsiveBreakpoints.of(context).largerThan(TABLET)
                        ? ResponsiveRowColumnType.ROW
                        : ResponsiveRowColumnType.COLUMN,
                rowPadding: const EdgeInsets.all(5),
                columnPadding: const EdgeInsets.all(5),
                rowMainAxisAlignment: MainAxisAlignment.center,
                rowSpacing: 10,
                children: [
                  ResponsiveRowColumnItem(
                    child: ProductWidget(
                      width: width,
                      name: 'Masak apa chef?',
                      image: 'assets/img/gosong_chef.jpg',
                      desc: 'Gosong chef',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ProductWidget(
                      width: width,
                      name: 'Iyakah bro?',
                      image: 'assets/img/mencurigakan.jpg',
                      desc: 'Mencurigakan',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ProductWidget(
                      width: width,
                      name: 'Kacau',
                      image: 'assets/img/kacau.jpeg',
                      desc: 'Kachau',
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                height: 150,
                color: Colors.blue,
                child: ResponsiveRowColumn(
                  layout:
                      ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                          ? ResponsiveRowColumnType.ROW
                          : ResponsiveRowColumnType.COLUMN,
                  rowPadding: const EdgeInsets.all(5),
                  columnPadding: const EdgeInsets.all(5),
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  columnSpacing: 10,
                  rowSpacing: 25,
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  columnMainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Text('Instagram', style: getDescWhite(context)),
                    ),
                    ResponsiveRowColumnItem(
                      child: Text('Github', style: getDescWhite(context)),
                    ),
                    ResponsiveRowColumnItem(
                      child: Text('Facebook', style: getDescWhite(context)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.width,
    required this.name,
    required this.image,
    required this.desc,
  });

  final double width;
  final String name;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: width * 0.2, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: 5,
              ),
              width: width * 0.2,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text('$name', style: getDescWhite(context)),
                  const SizedBox(width: 5),
                  Text('$desc', style: getDescWhite(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
