import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/register/register_cubit.dart';
import 'package:form_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child:const _RegisterView(),
    )
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    return Form(
        
        child: Column(
          children: [
            const SizedBox(height: 30,),
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: registerCubit.usernameChanged,
              errorMessage: username.isPure || username.isValid
              ? null
              : 'Usuario no válido'
              
              //  (value) {
              //   registerCubit.usernameChanged(value);
              //Cada vez que el usuario escribe algo valida su estado, en tiempo real
                
              // },
              /* El mismo cubit valida estos campos en la clase username.dart
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) return 'Mínimo 6 caracteres';
                return null;
              },*/
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Correo electrónico',
              onChanged: (value) {
                registerCubit.emailChanged(value);
                //Cada vez que el usuario escribe algo valida su estado, en tiempo real
                
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );

                if(!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                label: 'Contraseña',
                obscureText: true,
                onChanged: (value) {
                registerCubit.passwordChanged(value);
                //Cada vez que el usuario escribe algo valida su estado, en tiempo real
                
              },
                validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) return 'Mínimo 6 caracteres';
                return null;
              },
              ),
                
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                
                

                registerCubit.onSubmit();
              },
              icon: const Icon(Icons.save),
              label: const Text('Crear usuario'),
            ),
          ],
        ));
  }
}
