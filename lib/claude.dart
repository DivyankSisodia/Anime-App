// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CategoryScreen extends StatefulWidget {
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoryScreen> {
//   List<String> categories = ['Fruits', 'Vegetables', 'Diary', 'Meat'];
//   String? selectedCategory;
//   List<Product> filteredProducts = [];

//   // Hardcoded lists of products for each category
//   List<Product> fruitProducts = [
//     Product(name: 'Apple', category: 'Fruits'),
//     Product(name: 'Banana', category: 'Fruits'),
//     Product(name: 'Orange', category: 'Fruits'),
//     Product(name: 'Mango', category: 'Fruits'),
//     Product(name: 'Pineapple', category: 'Fruits'),
//   ];

//   List<Product> vegetableProducts = [
//     Product(name: 'Carrot', category: 'Vegetables'),
//     Product(name: 'Broccoli', category: 'Vegetables'),
//     Product(name: 'Tomato', category: 'Vegetables'),
//     Product(name: 'Cucumber', category: 'Vegetables'),
//     Product(name: 'Potato', category: 'Vegetables'),
//   ];

//   List<Product> dairyProducts = [
//     Product(name: 'Milk', category: 'Diary'),
//     Product(name: 'Cheese', category: 'Diary'),
//     Product(name: 'Butter', category: 'Diary'),
//     Product(name: 'Yogurt', category: 'Diary'),
//     Product(name: 'Ice Cream', category: 'Diary'),
//   ];

//   List<Product> meatProducts = [
//     Product(name: 'Chicken', category: 'Meat'),
//     Product(name: 'Beef', category: 'Meat'),
//     Product(name: 'Fish', category: 'Meat'),
//     Product(name: 'Pork', category: 'Meat'),
//     Product(name: 'Turkey', category: 'Meat'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categories'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedCategory = categories[index];
//                       filteredProducts =
//                           getProductsForCategory(selectedCategory!);
//                     });
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(getCategoryIcon(categories[index])),
//                         Text(categories[index]),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 0.7,
//               ),
//               itemCount: filteredProducts.length,
//               itemBuilder: (context, index) {
//                 return ProductTile(product: filteredProducts[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Product> getProductsForCategory(String category) {
//     switch (category) {
//       case 'Fruits':
//         return fruitProducts;
//       case 'Vegetables':
//         return vegetableProducts;
//       case 'Diary':
//         return dairyProducts;
//       case 'Meat':
//         return meatProducts;
//       default:
//         return [];
//     }
//   }

//   IconData getCategoryIcon(String category) {
//     // Implement your logic to return the appropriate icon for each category
//     switch (category) {
//       case 'Fruits':
//         return Icons.apple;
//       case 'Vegetables':
//         return Icons.local_florist;
//       case 'Diary':
//         return CupertinoIcons.checkmark;
//       case 'Meat':
//         return Icons.fastfood;
//       default:
//         return Icons.shopping_basket;
//     }
//   }
// }

// class Product {
//   final String name;
//   final String category;

//   Product({required this.name, required this.category});
// }

// class ProductTile extends StatelessWidget {
//   final Product product;

//   const ProductTile({super.key, required this.product});

// ignore_for_file: library_private_types_in_public_api

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text(product.name));
//   }
// }
// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';

// class Clock extends StatefulWidget {
//   @override
//   _ClockState createState() => _ClockState();
// }

// class _ClockState extends State<Clock> {
//   @override
//   void initState() {
//     super.initState();
//     // Update the clock every second
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (mounted) {
//         setState(() {});
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: CustomPaint(
//         painter: ClockPainter(),
//       ),
//     );
//   }
// }

// class ClockPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//     final radius = min(centerX, centerY);

//     // Draw the clock face
//     final facePaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//     canvas.drawCircle(Offset(centerX, centerY), radius, facePaint);

//     // Draw the hour hand
//     final hour = DateTime.now().hour;
//     final hourRadians = (hour % 12 + DateTime.now().minute / 60) * pi / 6;
//     final hourX = centerX + radius * 0.4 * cos(hourRadians);
//     final hourY = centerY + radius * 0.4 * sin(hourRadians);
//     final hourPaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 6;
//     canvas.drawLine(Offset(centerX, centerY), Offset(hourX, hourY), hourPaint);

//     // Draw the minute hand
//     final minute = DateTime.now().minute;
//     final minuteRadians = minute * pi / 30;
//     final minuteX = centerX + radius * 0.6 * cos(minuteRadians);
//     final minuteY = centerY + radius * 0.6 * sin(minuteRadians);
//     final minutePaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4;
//     canvas.drawLine(
//         Offset(centerX, centerY), Offset(minuteX, minuteY), minutePaint);

//     // Draw the second hand
//     final second = DateTime.now().second;
//     final secondRadians = second * pi / 30;
//     final secondX = centerX + radius * 0.6 * cos(secondRadians);
//     final secondY = centerY + radius * 0.6 * sin(secondRadians);
//     final secondPaint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;
//     canvas.drawLine(
//         Offset(centerX, centerY), Offset(secondX, secondY), secondPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Clock'),
        ),
        body: Center(
          child: Clock(),
        ),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    super.initState();
    // Update the clock every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);

    final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < 12; i++) {
      final angle = 2 * pi / 12 * i;
      final startX = centerX + cos(angle) * radius * 0.8;
      final startY = centerY + sin(angle) * radius * 0.8;
      final endX = centerX + cos(angle) * radius * 0.9;
      final endY = centerY + sin(angle) * radius * 0.9;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), linePaint);

      final textSpan = TextSpan(
        // text: '${i + 1}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      );
      textPainter.text = textSpan;
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          centerX + cos(angle) * radius * 1.05 - textPainter.width / 2,
          centerY + sin(angle) * radius * 1.05 - textPainter.height / 2,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
