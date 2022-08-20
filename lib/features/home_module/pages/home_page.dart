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
          body: HomeSearchComponent(
            homeSearchCubit: homeSearchCubit,
          ),
          iconSrc: '',
          landingLeft: const Icon(Icons.search),
          titleWidget: SizedBox(
            width: double.infinity,
            child: HomeSearchField(
              onFieldSubmitted: (String input) {
                homeSearchCubit.getSearchResult(
                  input: HomeSearchInput(
                    query: sendSearchWords(input),
                    type: ['artist'],
                    token:
                        'BQDU-Hy_hwsiHXkYjGsHCVNtydQ5gzQczu2aMGaH7cDbkdc-v_Nj3Ee3Z1vQftkMB8N2xtmiig1RpneNNBe-o8aubAyChD6ta9E_Nv8LNnE1ydWti9kbXVbjek-aH2Azz3RCHfYkf2KXAJLRXzYgZhK7Xose0q7NOpGjFiZ-tbXoTXaK7-bYXgNNaXf7TAjhURg',
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
