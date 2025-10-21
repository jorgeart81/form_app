import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuevo Usuario')),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Column(
            children: [FlutterLogo(size: 100), const _RegisterForm()],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 10,
        children: [
          CustomTextFormField(label: 'Nombre de usuario'),
          CustomTextFormField(label: 'Correo electrónico'),
          CustomTextFormField(label: 'Contraseña', obscureText: true),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FilledButton.tonalIcon(
              onPressed: () {},
              icon: Icon(Icons.save),
              label: Text('Crear usuario'),
            ),
          ),
        ],
      ),
    );
  }
}
