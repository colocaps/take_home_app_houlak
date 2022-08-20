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
                        'BQDT3CaU2EFm2GwvPcSAvpI--HX6n0WWi9xFV60Kv1TqhLVgDOte731tA6LHfb2y4FiXbFojuMiagDEDKAr-SGKpOwW_cXE1V0OTHSoQryPBlEaIt6KoDzHh3MyVpXuqYwUonlgELkjOehbBrGSQ74MfbAiq8EQn-UQw6PGul5rbiTpYtMgin8UUKKTV-2jta_s',
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
