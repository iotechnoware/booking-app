import 'package:flutter/material.dart';
import 'package:gofly/core/enums/bottom_navigation.dart';
import 'package:gofly/ui/views/main_view/explore_view/explore_view.dart';
import 'package:gofly/ui/views/main_view/home_page_view/home_page_view.dart';
import 'package:gofly/ui/views/main_view/trips_view/trips_view.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';




class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();

  BottomNavigationEnum select = BottomNavigationEnum.HOME;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: const [
              HomePageView(),
              ExploreView(),
              TripsView(),
            ],
          ),

          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: BottomNavigationWidget(
              bottomNavigation: select,
              onTap: (selected , pageNumber ) {
                // key.currentState!.openDrawer();
                setState(() {
                  select = selected;
                }
                );
                controller.jumpToPage(pageNumber);
              },
            ),
          ),
        ],
      ),
    );
  }
}