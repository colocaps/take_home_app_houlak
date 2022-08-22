import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home_search/home_search.dart';
import 'package:houlak_take_home_app/features/sign_in/sign_in_module.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeSearchCubit = InjectorContainer.instance.resolve<HomeSearchCubit>();
    final GlobalKey<FormState> formKey = GlobalKey();
    final token = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          _areYouSure(context, () {
            SignInModule.navigateToSignIn(context);
          });
          return false;
        },
        child: Form(
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
                      token: token,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _areYouSure(
    BuildContext context,
    VoidCallback okAction,
  ) {
    AlertDialogUtils.showAlertWithTwoActions(
      context: context,
      image: Image.asset(
        'assets/images/loading.gif',
        package: 'core',
        height: 80,
        width: 80,
      ),
      title: AppLocalizations.of(context)!.are_you_sure_of_sign_out,
      subtitle: '',
      okAction: okAction,
      titleOkButton: 'OK',
      cancelAction: () {
        Navigator.pop(context);
      },
      titleCancelButton: AppLocalizations.of(context)!.cancel,
      theme: Theme.of(context),
    );
  }

  String sendSearchWords(String input) {
    String result = input.replaceAll(RegExp(' '), '%20');
    return result;
  }
}
