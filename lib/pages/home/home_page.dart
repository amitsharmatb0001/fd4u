import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart'; // New: Import persistent_bottom_nav_bar_v2 package
import 'package:fd4u/pages/cart/cart_page.dart';
import 'main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // New: PersistentTabController manages currently selected tab index and allows programmatic control
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize controller with starting tab index (equivalent to initial _selectedIndex in old code)
    _controller = PersistentTabController(initialIndex: 0);
  }

  // NEW pattern: Instead of separate lists for nav items and pages,
  // use a single list of PersistentTabConfig objects combining screens and tab items.
  List<PersistentTabConfig> _buildTabs() {
    return [
      PersistentTabConfig(
        screen: const MainFoodPage(), // Page shown for this tab (similar to pages[0] in old code)
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.home), // Tab icon
          title: "Home",                       // Tab title (can be used or hidden by style)
          activeForegroundColor: CupertinoColors.activeBlue,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
      PersistentTabConfig(
        screen: Container(
          child: const Center(child: Text("Next Page")), // Placeholder page for 2nd tab
        ),
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.add),
          title: "Signup",
          activeForegroundColor: CupertinoColors.activeBlue,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
      PersistentTabConfig(
        screen: const CartPage(), // Cart page screen
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.cart_fill),
          title: "Cart History",
          activeForegroundColor: CupertinoColors.activeBlue,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
      PersistentTabConfig(
        screen: Container(
          child: const Center(child: Text("Next next Page")), // Placeholder for account tab
        ),
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.person_crop_circle),
          title: "Account",
          activeForegroundColor: CupertinoColors.activeBlue,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,  // NEW: Pass controller instead of manual index tracking and setState
      tabs: _buildTabs(),       // NEW: Pass list of PersistentTabConfig instead of separate screens & items

      // NEW: navBarBuilder builds the bottom nav bar UI;
      // Replace simple BottomNavigationBar with provided style widget for custom animations, styles etc.
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(navBarConfig: navBarConfig),

      // Note: Many old BottomNavigationBar parameters like selectedItemColor,
      // showLabels, etc. are replaced by customization inside Style2BottomNavBar style widget.

      // IMPORTANT: PersistentTabView automatically manages navigation stacks for each tab.
      // This means when switching tabs, internal navigation state inside each tab persists (unlike old code).
      // You no longer need to rebuild pages manually or manage selected index via setState.

      // Animation and tab switching are handled for you by the package.
    );
  }
}
