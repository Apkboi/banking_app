import 'package:banking_app/features/home/presentation/screens/home_tab.dart';
import 'package:banking_app/features/more/presentation/screens/more_tab.dart';
import 'package:banking_app/features/pay/presentation/screens/pay_screen.dart';
import 'package:banking_app/features/transactions/presentation/screens/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activePage = 0;
  final PageController _pageController = PageController();
  List<Widget> pages = [
    const HomeTab(),
    const PayScreen(),
    const TransactionsScreen(),
    const MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: GNav(
          selectedIndex: _activePage,

          // tab button hover color
          haptic: true,
          // hapti
          onTabChange: (index) {
            _selectedTab(index);
          },
          // c feedback
          tabBorderRadius: 15,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
          // tabActiveBorder: Border.all(color: Colors.blueGrey, width: 1), // tab button border
          // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
          // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          curve: Curves.easeIn,
          // tab animation curves
          duration: const Duration(milliseconds: 400),
          // tab animation duration
          gap: 8,
          // the tab button gap between icon and text
          // color: Colors.grey[800], // unselected icon color
          activeColor: Theme.of(context).colorScheme.onPrimary,
          // selected icon and text color
          iconSize: 24,
          // tab button icon size
          // tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          // navigation bar padding

          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.show_chart_rounded,
              text: 'Pay',
            ),
            GButton(
              icon: LineIcons.barChartAlt,
              text: 'Transactions',
            ),
            GButton(
              icon: LineIcons.braille,
              text: 'More',
            )
          ],
        ),
      ),
    );
  }

  void _selectedTab(int index) {
    setState(() {
      _activePage = index;
      _pageController.jumpToPage(index);
      // setState(() {
      //   _activePage = index;
      //   if (index == 3) {
      //     StorageHelper.setBoolean(StorageKeys.stayLoggedIn, false);
      //   } else if (index == 2) {
      //     StorageHelper.setBoolean(StorageKeys.hasOnBoarded, false);
      //   }
      // });
    });
  }
}
