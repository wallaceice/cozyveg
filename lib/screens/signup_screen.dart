import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../model/cliente.dart';
import '../model/login_data.dart';

class CadastroCliente extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Cliente cliente = Cliente();
  //GlobalKey<FormState> formkey = GlobalKey();

  CadastroCliente({Key? key}) : super(key: key);

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
            keyboardType: TextInputType.emailAddress,
            validator: (String? inValue) {
              if (inValue != null) {
                if (inValue.isEmpty) {
                  return "Insira seu Email";
                }
              }
              return null;
            },
            onSaved: (String? inValue) {
              username = inValue ?? "";
            },
            decoration: const InputDecoration(
              hintText: "user@domain.br",
              labelText: "E-mail Address",
            ),
          ),
          TextFormField(
            obscureText: true,
            validator: (String? inValue) {
              if (inValue != null) {
                if (inValue.length < 10) {
                  return "Mínimo de 10 caracteres";
                }
              }
              return null;
            },
            onSaved: (String? inValue) {
              password = inValue ?? "";
            },
            decoration: const InputDecoration(
              labelText: "Insira uma senha forte",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                // Lançando evento
                BlocProvider.of<AuthBloc>(context)
                    .add(RegisterUser(username: username, password: password));
              }
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}


/*
class CadastroCliente extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Cliente cliente = Cliente();

  //GlobalKey<FormState> formkey = GlobalKey();

  CadastroCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GlobalKey<FormState> formkey = GlobalKey();
    //String username = "";
    //String password = "";
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //nameFormField(),
              emailFormField(),
              passwordFormField(),
              //documentFormField(),
              //enderecoFormField(),
              const Divider(),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

/*
  Widget nameFormField() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          validator: (String? inValue) {
            if (inValue != null) {
              if (inValue.isEmpty) {
                return "Insira seu Nome";
              }
            }
            return null;
          },
          onSaved: (String? inValue) {
            cliente.name = inValue ?? "";
          },
          decoration: const InputDecoration(
            hintText: "Wallace",
            labelText: "nome",
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.name,
          validator: (String? inValue) {
            if (inValue != null) {
              if (inValue.isEmpty) {
                return "Insira seu Sobrenome";
              }
            }
            return null;
          },
          onSaved: (String? inValue) {
            cliente.setLastName = inValue ?? "";
          },
          decoration: const InputDecoration(
            hintText: "Silva",
            labelText: "sobrenome",
          ),
        ),
      ],
    );
  }
*/
  Widget emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira seu Email";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        cliente.setEmail = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "user@domain.br",
        labelText: "E-mail Address",
      ),
    );
  }

/*
  Widget documentFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira seu CPF";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        cliente.setCpf = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "000.000.000-57",
        labelText: "CPF",
      ),
    );
  }

  Widget enderecoFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira seu endereco";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        cliente.setEndereco = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "R. Paschoal Marmo, 1888 - Jardim Nova Italia, Limeira",
        labelText: "Nome da rua , numero - bairro",
      ),
    );
  }
*/
  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 10) {
            return "Mínimo de 10 caracteres";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        cliente.setPsw = inValue ?? "";
      },
      decoration: const InputDecoration(
        labelText: "Insira uma senha forte",
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text("Cadastrar!"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          cliente.printcliente(); //// printa cliente no console
        }
      },
    );
  }


  Widget submitButton() {
    return ElevatedButton(
      child: const Text("Cadastrar!"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          cliente.printcliente();
          BlocProvider.of<AuthBloc>(context)
              .add(RegisterUser(username: username, password: password));
          //// printa cliente no console
        }
      },
    );
  }
  
}
*/

