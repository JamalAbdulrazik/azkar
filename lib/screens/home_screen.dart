import 'package:flutter/material.dart';
import 'package:material_design/screens/prayer_time.dart';
import 'package:material_design/screens/qibla.dart';
import 'package:material_design/screens/quotes.dart';

import 'azkar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin, RestorationMixin{
  TabController? _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController!.index = tabIndex.value;
  }

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController!.addListener(() {
      setState(() {
        tabIndex.value = _tabController!.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tiles = <String>[
      'موقيت الصلاة'
      'الاذكار'
      'القبلة'
      'فوائد'
    ];
    final tabs = <Widget>[
      PrayTimeScreen(),
      Azkar(),
      DirectionOfPrayer(),
      Quotes(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاذكار'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            for (final name in tiles) Tab(text: name),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final tab in tabs)
            Center(
              child: tab,
            ),
        ],
      ),
    );
  }
}






