import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/cat/nuts.png',
    'assets/images/cat/nuts.png',
    'assets/images/cat/nuts.png',
    'assets/images/cat/nuts.png',
  ];

  // ตัวอย่างรายการสินค้า
  final List<Map<String, dynamic>> _products = [
    {
      'image': 'assets/images/cat/nuts.png',
      'title': 'Product Title 1',
      'price': 50.0,
      'salePrice': 70.0,
      'weight': '1KG',
    },
    {
      'image': 'assets/images/cat/fruits.png',
      'title': 'Product Title 2',
      'price': 30.0,
      'salePrice': 40.0,
      'weight': '500g',
    },
    {
      'image': 'assets/images/cat/veg.png',
      'title': 'Product Title 3',
      'price': 120.0,
      'salePrice': 150.0,
      'weight': '1KG',
    },
    {
      'image': 'assets/images/cat/Spinach.png',
      'title': 'Product Title 4',
      'price': 80.0,
      'salePrice': 90.0,
      'weight': '250g',
    },
    {
      'image': 'assets/images/cat/grains.png',
      'title': 'Product Title 5',
      'price': 45.0,
      'salePrice': 55.0,
      'weight': '100g',
    },
    // เพิ่มสินค้าอื่นๆ ตามต้องการ
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;

    return Scaffold(
      body: SingleChildScrollView(
        // เพิ่ม SingleChildScrollView ครอบ Column
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  ),
                ),
              ),
            ),
            // ส่วนของสินค้าที่ต้องการเพิ่ม
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // เพิ่ม SizedBox เพื่อกำหนดความสูง
                height: size.height * 0.3, // กำหนดความสูงตามต้องการ
                child: ListView.builder(
                  // เปลี่ยน Row เป็น ListView.builder
                  scrollDirection:
                      Axis.horizontal, // กำหนดทิศทางการเลื่อนเป็นแนวนอน
                  itemCount: _products.length, // จำนวนสินค้า
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0), // เพิ่มระยะห่างระหว่างสินค้า
                      child: Container(
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: Image.asset(
                                product['image'],
                                height: size.width * 0.25,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['weight'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.shopping_bag_outlined),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.favorite_border),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "${product['price']} ฿",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${product['salePrice']} ฿",
                                        style: TextStyle(
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product['title'],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
