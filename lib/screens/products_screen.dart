import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';
import '../model/complete_model.dart';
import '../model/note.dart';

class CompleteForm extends StatefulWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CompleteFormState();
  }
}

class CompleteFormState extends State<CompleteForm> {
  final CompleteModel completeModel = CompleteModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      Note note;
      if (state is UpdateState) {
        note = state.previousNote;
      } else {
        note = Note();
      }
      return SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(children: [
                  const Text(
                      "Qual a chance de nos indicar para amigos e conhecidos?"),
                  mySlider()
                ]),
                SizedBox(height: 300, child: myProducts()),
                Row(children: [
                  myCheckbox4(),
                  const Text("Quero receber notícias e promoções")
                ]),
                const Divider(),
                myButtonSnackBar(),
                //const Divider(),
                //myButtonBottomSheet(),
              ],
            )),
      );
    });
  }

  Widget myCheckbox() {
    Note note = Note();
    note.title = "camembert comum";
    note.description = "assets/images/camembert.jpg";

    return Checkbox(
      value: completeModel.checkboxValue,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.checkboxValue = inValue;
          });
        }
        BlocProvider.of<ManageBloc>(context).add(
          SubmitEvent(
            note: Note.withData(
              title: note.title,
              description: note.description,
            ),
          ),
        );
      },
    );
  }

  Widget myCheckbox1() {
    Note note = Note();
    note.title = "camembert trufado";
    note.description = "assets/images/camembert_truf.jpg";

    return Checkbox(
      value: completeModel.checkboxValue1,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.checkboxValue1 = inValue;
          });
          BlocProvider.of<ManageBloc>(context).add(
            SubmitEvent(
              note: Note.withData(
                title: note.title,
                description: note.description,
              ),
            ),
          );
        }
      },
    );
  }

  Widget myCheckbox2() {
    Note note = Note();
    note.title = "creme";
    note.description = "assets/images/creme.jpg";

    return Checkbox(
      value: completeModel.checkboxValue2,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.checkboxValue2 = inValue;
          });
        }
        BlocProvider.of<ManageBloc>(context).add(
          SubmitEvent(
            note: Note.withData(
              title: note.title,
              description: note.description,
            ),
          ),
        );
      },
    );
  }

  Widget myCheckbox3() {
    Note note = Note();
    note.title = "queijo fumé";
    note.description = "assets/images/fume.jpg";

    return Checkbox(
      value: completeModel.checkboxValue3,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.checkboxValue3 = inValue;
          });
        }
        BlocProvider.of<ManageBloc>(context).add(
          SubmitEvent(
            note: Note.withData(
              title: note.title,
              description: note.description,
            ),
          ),
        );
      },
    );
  }

  Widget myCheckbox4() {
    return Checkbox(
      value: completeModel.checkboxValue4,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.checkboxValue4 = inValue;
          });
        }
      },
    );
  }

  Widget mySwitch() {
    return Switch(
      value: completeModel.switchValue,
      onChanged: (bool inValue) {
        setState(() {
          completeModel.switchValue = inValue;
        });
      },
    );
  }

  Widget mySlider() {
    return Slider(
      min: 0,
      max: 20,
      value: completeModel.sliderValue,
      onChanged: (double inValue) {
        setState(() => completeModel.sliderValue = inValue);
      },
    );
  }

  Widget myRadio(int value) {
    return Radio(
      value: value, // Valor deste botão
      groupValue: completeModel.radioValue, // Valor do grupo
      onChanged: (int? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.radioValue = inValue;
          });
        }
      },
    );
  }

  Widget myButtonSnackBar() {
    return ElevatedButton(
      child: const Text("Confirmar Compra!"),
      onPressed: () {
        completeModel.doSomething();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
            content: const Text("Obrigado"),
            action: SnackBarAction(
                label: "Volte Sempre! ${completeModel.checkboxValue}",
                onPressed: () {})));
      },
    );
  }

  myProducts() {
    return ListView(
      children: <Widget>[
        Row(children: [
          Image.asset(
            'assets/images/camembert.jpg',
            width: 100,
          ),
          myCheckbox(),
          const Text("Camembert comum")
        ]),
        Row(children: [
          Image.asset(
            'assets/images/camembert_truf.jpg',
            width: 100,
          ),
          myCheckbox1(),
          const Text("Camembert trufado")
        ]),
        Row(children: [
          Image.asset(
            'assets/images/creme.jpg',
            width: 100,
          ),
          myCheckbox2(),
          const Text("Creme fraiche")
        ]),
        Row(children: [
          Image.asset(
            'assets/images/fume.jpg',
            width: 100,
          ),
          myCheckbox3(),
          const Text("Queijo Fumé")
        ]),
      ],
    );
  }
}
