import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/domain/interactor/sing_in_input.dart';
import 'package:sign_in/src/presentation/cubit/sign_in_cubit.dart';
import 'package:sign_in/src/presentation/widgets/sign_in_build_initial.dart';

class SignInComponent extends StatelessWidget {
  final SignInCubit _signInCubit;
  final WebAuth _webAuth;
  final Function(BuildContext, String) _onSignInCorrect;

  const SignInComponent({
    Key? key,
    required SignInCubit signInCubit,
    required WebAuth webAuth,
    required Function(BuildContext, String) onSignInCorrect,
  })  : _signInCubit = signInCubit,
        _webAuth = webAuth,
        _onSignInCorrect = onSignInCorrect,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _signInCubit,
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) async {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cancelado por el usuario'),
              ),
            );
            await _signInCubit.initState();
          } else if (state is Loaded) {
            _onSignInCorrect(
              context,
              state.authorizationEntity.accessToken,
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
      );
    }
    return Container();
  }
}
