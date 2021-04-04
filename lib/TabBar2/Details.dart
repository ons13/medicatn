import 'EffetInd.dart';
import 'Plus.dart';
import 'general.dart';
import 'interac.dart';
import 'package:flutter/material.dart';



class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
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

      body: TabBarView(
        children: <Widget>[
          GeneralPage(),
          InteracPage(),
          EffetIndPage(),
          PlusPage(),
        ],
        // If you want to disable swiping in tab the use below code
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          child: Container(
            color: Colors.black26,
            child: TabBar(
              labelColor: Color.fromRGBO(46, 112, 74, 1),
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 10.0),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black54, width: 0.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
              //For Indicator Show and Customization
              indicatorColor: Colors.black54,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home_filled,
                    size: 30.0,
                  ),
                  text: 'General',
                ),

                Tab(
                  icon: Icon(
                    Icons.backspace_outlined,
                    size: 30.0,
                  ),
                  text: 'Interact',
                ),
                Tab(
                  icon: Icon(
                    Icons.format_align_left_outlined,
                    size: 30.0,
                  ),
                  text: 'EI',
                ),
                Tab(
                  icon: Icon(
                    Icons.more,
                    size: 30.0,
                  ),
                  text: 'Plus..',
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
