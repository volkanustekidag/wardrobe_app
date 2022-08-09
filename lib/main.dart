import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wardrobe_app/blocs/bloc_observer.dart';
import 'package:wardrobe_app/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/pages/home_page/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBloc(),
        )
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              accentColor: primaryColor,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: primaryColor,
              )),
          home: HomePage(),
        );
      }),
    );
  }
}
