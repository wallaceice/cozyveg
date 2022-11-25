class Cliente {
  String name = "";
  String lastName = "";
  String cpf = "";
  String email = "";
  String endereco = "";
  final String uid;
  Cliente(this.uid);

  String _password = "";
  bool confirmed = false;

  String get getName => name;

  set setName(String name) {
    this.name = name;
  }

  String get getPsw => _password;

  set setPsw(String password) {
    _password = password;
  }

  String get getCpf => cpf;

  set setCpf(String cpf) {
    this.cpf = cpf;
  }

  String get getEmail => email;

  set setEmail(String email) {
    this.email = email;
  }

  String get getLastName => lastName;

  set setLastName(String lastName) {
    this.lastName = lastName;
  }

  String get getEndereco => endereco;

  set setEndereco(String endereco) {
    this.endereco = endereco;
  }

  printcliente() {
    print("nome: $name $lastName");
    print("Password: $_password");
    print("endereco: $endereco");
    print("email: $email");
  }
}
