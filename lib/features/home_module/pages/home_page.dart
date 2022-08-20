import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home_search/home_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeSearchCubit = InjectorContainer.instance.resolve<HomeSearchCubit>();
    final GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: PageContainerWithIcon(
          bgColor: Colors.black,
          appBarColor: Colors.blueAccent,
          withoutContentPadding: true,
          showIconContainer: false,
          centerTitle: true,
          showBoxContainer: false,
          appBarHeight: 80,
          body: HomeSearchComponent(
            homeSearchCubit: homeSearchCubit,
          ),
          iconSrc: '',
          landingLeft: const Icon(Icons.search),
          titleWidget: SizedBox(
            height: 50,
            width: double.infinity,
            child: HomeSearchField(
              onFieldSubmitted: (String input) {
                homeSearchCubit.getSearchResult(
                  input: HomeSearchInput(
                    query: sendSearchWords(input),
                    type: ['artist'],
                    token:
                        'BQDZYaqXjH_TQ3t_PeEjJqoQ1_dlbJti59yyKWh9aIDUMTROLfx90h5pEbmlgv3XFeURweRaYpW6MgCWCwz6BIhvA8QQVgnPBVT8Jll2US27E3M3tueGfwig8gPrinVZbqsRScjt2a-8-4csN6lvicK-uXv4_m062JIS0A1tJMifFOMFupGHV1pmwxG9U21FHxM',
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String sendSearchWords(String input) {
    String result = input.replaceAll(RegExp(' '), '%20');
    return result;
  }
}
