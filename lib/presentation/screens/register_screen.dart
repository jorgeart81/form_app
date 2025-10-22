import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Column(children: [FlutterLogo(size: 100), _RegisterForm()]),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  _RegisterForm();

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) => Form(
        child: Column(
          spacing: 10,
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChange: cubit.usernameChanged,
              errorText: state.username.isValid || state.username.isPure
                  ? null
                  : 'Usuario no valido',
            ),
            CustomTextFormField(
              label: 'Correo electrónico',
              onChange: cubit.emailChanged,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo requerido';
                }
                if (!emailRegExp.hasMatch(value)) {
                  return 'No tiene formato de correo';
                }

                return null;
              },
            ),
            CustomTextFormField(
              label: 'Contraseña',
              onChange: cubit.passwordChanged,
              obscureText: true,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FilledButton.tonalIcon(
                onPressed: () {
                  cubit.onSubmit();
                },
                icon: Icon(Icons.save),
                label: Text('Crear usuario'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
