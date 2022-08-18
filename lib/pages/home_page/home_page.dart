import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wardrobe_app/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/pages/category_page/category_page.dart';
import 'package:wardrobe_app/pages/combine_page/combine_page.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/pages/profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [CategoryPage(), CombinePage(), ProfilePage()];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          if (state is ChangedPage) {
            currentIndex = state.newIndex;
          }
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                onTap: (index) {
                  BlocProvider.of<BottomNavBloc>(context)
                      .add(ChangeCurrentIndexNavBarEvent(newIndex: index));
                },
                selectedItemColor: primaryColor,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: primaryColor,
                ),
                selectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/svg/tWardrobe.svg",
                          width: 6.w),
                      activeIcon: SvgPicture.asset("assets/svg/bWardrobe.svg",
                          width: 6.w),
                      label: "Closet"),
                  BottomNavigationBarItem(
                      icon:
                          SvgPicture.asset("assets/svg/tComb.svg", width: 6.w),
                      activeIcon:
                          SvgPicture.asset("assets/svg/bComb.svg", width: 6.w),
                      label: "Combine"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/svg/tProfile.svg",
                          width: 6.w),
                      activeIcon: SvgPicture.asset("assets/svg/bProfile.svg",
                          width: 6.w),
                      label: "Profile"),
                ]),
          );
        },
      ),
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          if (state is ChangedPage) return pageList[state.newIndex];
          return CategoryPage();
        },
      ),
    );
  }
}
