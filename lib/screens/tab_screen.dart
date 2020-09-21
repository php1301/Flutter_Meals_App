// import 'package:flutter/material.dart';
// import '../screens/categories_screen.dart';
// import '../screens/favorites_screen.dart';

// class TabScreen extends StatefulWidget {
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Category',
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
