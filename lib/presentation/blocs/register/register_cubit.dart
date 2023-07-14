import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_app/infrastructure/inputs/inputs.dart';
import 'package:form_app/infrastructure/inputs/password.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit(){
    print('Submit $state');
  }

void usernameChanged(String value){

  final username = Username.dirty(value);
  emit(
    state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password])
    )
  );

}

void emailChanged(String value){
emit(
    state.copyWith(
      email: value
    )
  );


}

void passwordChanged(String value){
  final password = Password.dirty(value);
emit(
    state.copyWith(
      
      password: password,
      isValid: Formz.validate([password,state.username])
    )
  );


}

}
