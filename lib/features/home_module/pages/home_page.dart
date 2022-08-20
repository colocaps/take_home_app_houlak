import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home_search/home_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeSearchCubit = InjectorContainer.instance.resolve<HomeSearchCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: HomeSearchComponent(
              homeSearchCubit: homeSearchCubit,
            ),
          ),
        ),
      ),
    );
  }
}
