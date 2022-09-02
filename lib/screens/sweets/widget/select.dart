
import 'package:flutter/material.dart';

class SelectGovernorates extends StatefulWidget {
  const SelectGovernorates({Key? key}) : super(key: key);

  @override
  State<SelectGovernorates> createState() => _SelectGovernoratesState();
}

class _SelectGovernoratesState extends State<SelectGovernorates> {
  var formKey = GlobalKey<FormState>();

  final List<String> _items =[
    'القاهرة ',
    'اسيوط',
    'بورسعيد',
    'الجيزه',
  ];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(

        child: Form(
          key: formKey,
          child: DropdownButtonFormField<String>(
              hint: Text('اختار المحافظة',style: TextStyle(
                  color: Colors.black
              ),),
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              elevation: 19,
              style: const TextStyle(color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              autofocus: true,

              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  if(formKey.currentState!.validate()){

                  }
                });

              },
              validator: (value) => dropdownValue == null ? 'برجاء اختيار المحافظة': null,
              items: _items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()

          ),
        ),
      ),
    );
  }
}