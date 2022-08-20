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
      body: PageContainerWithIcon(
        bgColor: Colors.white,
        appBarColor: Colors.blueAccent,
        withoutContentPadding: true,
        showIconContainer: false,
        centerTitle: true,
        showBoxContainer: false,
        body: HomeSearchComponent(homeSearchCubit: homeSearchCubit),
        iconSrc: '',
        landingLeft: const Icon(Icons.search),
        titleWidget: const SizedBox(
          width: double.infinity,
          child: HomeSearchField(),
        ),
      ),
    );
  }
}
