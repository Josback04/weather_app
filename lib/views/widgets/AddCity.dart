import 'package:flutter/material.dart';

class AddCityView extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Function(String) onAddCity;
  AddCityView({required this.onAddCity});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Ajouter une ville"),
          ),
        ),
        IconButton(
          onPressed: (() => onAddCity(controller.text)),
          icon: Icon(Icons.send),
        )
      ],
    );
  }
}
