import 'package:flutter/material.dart';
import 'package:horta_inteligente/pages/data.page.dart';
import 'package:horta_inteligente/pages/events.page.dart';
import 'package:horta_inteligente/pages/users-list.page.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: Navigator.canPop(context)
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.data_thresholding)),
                Tab(icon: Icon(Icons.apps_outage)),
                Tab(icon: Icon(Icons.manage_accounts)),
              ],
            ),
            title: Text(
              "Horta Inteligente",
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF1A1A27),
          ),
          body: const TabBarView(
            children: [
              DataPage(),
              EventsPage(),
              UsersList(),
            ],
          ),
        ),
      ),
    );
  }
}
