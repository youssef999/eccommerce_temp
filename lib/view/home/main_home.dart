
import 'package:ecommerce/view/cart/cart_view2.dart';
import 'package:ecommerce/view/category/category.dart';
import 'package:ecommerce/view/home/home_view.dart';
import 'package:ecommerce/view/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPgeState();
}

class _MainPgeState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        children: <Widget>[
          HomeView(),
          CategoriesView(),
          CartView3(),
          ProfileView(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Container(
            color: Colors.black54,
            child: TabBar(
              labelColor: Colors.pinkAccent,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 10),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black54, width: 0.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 24,
                  ),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(
                    Icons.bar_chart_sharp,
                    size: 24,
                  ),
                  text: "Catogary",
                ),
                Tab(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 24,
                  ),
                  text: "Cart",
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    size: 24,
                  ),
                  text: "Profile",
                ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}

//class

// int index = 0;
//   final Screens = [
//     HomeView(),
//     CategoryView(),
//     CartView2(),
//     ProfileView(),
//   ];

//   @override
//   void initState() {
//     Get.put(HomeView());
//     super.initState();
//   }




// Scaffold(
//       body: Screens[index],
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(23),
//         child: ClipRRect(
//           // clipBehavior: Clip.antiAlias,
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//           child: GNav(
//             backgroundColor: Colors.pink,
//             activeColor: Colors.white,

//             //tabBackgroundColor: Colors.pink,
//             color: Colors.white,
//             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//             selectedIndex: index,
//             onTabChange: (index) => setState(() => this.index = index),
//             tabs: const [
//               GButton(
//                 icon: Icons.home,
//                 text: "Home",
//               ),
//               GButton(
//                 icon: Icons.bar_chart_sharp,
//                 text: "Catogory",
//               ),
//               GButton(
//                 icon: Icons.shopping_bag_outlined,
//                 text: "Cart",
//               ),
//               GButton(
//                 icon: Icons.person_outline,
//                 text: "profile",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );