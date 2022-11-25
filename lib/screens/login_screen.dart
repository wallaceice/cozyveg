import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../model/login_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira algo como username";
              }
              return null;
            },
            onSaved: (String? inValue) {
              username = inValue!;
            },
          ),
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.length < 4) {
                return "Tem que ter ao menos 4 caracters";
              }
              return null;
            },
            onSaved: (String? inValue) {
              password = inValue!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                // Lançando evento
                BlocProvider.of<AuthBloc>(context)
                    .add(LoginUser(username: username, password: password));
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}

/*class SimpleForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData(username: "", password: "");

  SimpleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              usernameFormField(),
              passwordFormField(),
              const Divider(),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um nome de usuário";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.username = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "user@domain.br",
        labelText: "Username (E-mail Address)",
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 10) {
            return "Mínimo de 10 letras";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.password = inValue ?? "";
      },
      decoration: const InputDecoration(
        labelText: "Insira uma senha forte",
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text("Log In!"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          loginData.doSomething();
          BlocProvider.of<AuthBloc>(context)
              .add(LoginUser(username: username, password: password));
        }
      },
    );
  }
}
*/