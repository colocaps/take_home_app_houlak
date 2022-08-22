import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/domain/interactor/sing_in_input.dart';
import 'package:sign_in/src/presentation/cubit/sign_in_cubit.dart';
import 'package:sign_in/src/presentation/widgets/sign_in_build_initial.dart';

class SignInComponent extends StatelessWidget {
  final SignInCubit _signInCubit;
  final WebAuth _webAuth;
  final CustomTopSnackBarManager _customTopSnackBarManager;
  final Function(BuildContext, String) _onSignInCorrect;
  final String _titleText;
  final String _buttonText;
  final String _cancelText;
  final String _welcomeText;

  const SignInComponent({
    Key? key,
    required SignInCubit signInCubit,
    required WebAuth webAuth,
    required CustomTopSnackBarManager customTopSnackBarManager,
    required Function(BuildContext, String) onSignInCorrect,
    required String titleText,
    required String buttonText,
    required String cancelText,
    required String welcomeText,
  })  : _signInCubit = signInCubit,
        _webAuth = webAuth,
        _onSignInCorrect = onSignInCorrect,
        _customTopSnackBarManager = customTopSnackBarManager,
        _titleText = titleText,
        _buttonText = buttonText,
        _cancelText = cancelText,
        _welcomeText = welcomeText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _signInCubit,
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) async {
          if (state is Error) {
            _customTopSnackBarManager.showErrorTopSnackbar(
              context: context,
              message: _cancelText,
            );

            await _signInCubit.initState();
          } else if (state is Loaded) {
            _onSignInCorrect(
              context,
              state.authorizationEntity.accessToken,
            );
            _customTopSnackBarManager.showSuccessTopSnackbar(
              context: context,
              message: _welcomeText,
            );
          }
        },
        builder: _buildByState,
      ),
    );
  }

  Widget _buildByState(
    BuildContext context,
    SignInState state,
  ) {
    if (state is Initial) {
      return SignInBuildInitial(
        onPressed: () async => _signInCubit.getToken(
          input: SignInInput(
            authResponse: await _webAuth.authenticate(),
          ),
        ),
        buttonText: _buttonText,
        titleText: _titleText,
      );
    }
    return Container();
  }
}
