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
          bgColor: Theme.of(context).backgroundColor,
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
                        'BQB5b8NpTNZp3m9UcVzLNIZ83sZVpZhaArXhxDO6HM2L0QKytOUXyi_AYVrIMiVV7Mct1XoBbFe0sBvKJncZoCfMqWTQ0Qz1aRt_ZG0I38AQal7xXot9FlLkWDpJpUiuoveTnMWD3otQdAwZbVPZO0QmBp0UMHQmMQDhcqjn_C-CUQMoDeCGw4kJvBZ8vQQYVpA',
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
