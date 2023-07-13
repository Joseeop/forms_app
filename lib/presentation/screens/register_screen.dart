import 'package:flutter/material.dart';
import 'package:form_app/presentation/widgets/inputs/custom_text_form_field.dart';



class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }

}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100,),
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
    return Form(child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
        ),
        SizedBox(height: 10,),
        CustomTextFormField(
          label : 'Correo electrónico'
        ),

         SizedBox(height: 10,),
        CustomTextFormField(
          label : 'Contraseña',
          obscureText: true
        ),


        const SizedBox(height: 20,),
         FilledButton.tonalIcon(
                onPressed: (){},
               icon: const Icon(Icons.save),
               label: const Text('Crear usuario') , 
               ),
      ],
    ));
  }
}