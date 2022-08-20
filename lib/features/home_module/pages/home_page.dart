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
                        'BQAdlyI_L7fjhQoPpgKToD1WSkGZV3cTnivXhuqAnhU5GnRlS6oMGIg-SWTuVJl82RScscFa4G60irGozYjXVxzFvrwccaLMCyCM30cEykjQWs1o8w8I2Y0fFKeHFVuaOxCOXI_RttPGZqHqvCO8YX_P-JML5EK8MgE1olILEsTW15bqAsgxP0jfiuaDn3BBVcM',
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
