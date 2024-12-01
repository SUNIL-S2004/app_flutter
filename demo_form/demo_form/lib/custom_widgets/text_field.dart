import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {

  final String text1,hint;
  final TextEditingController Controller;
  final TextInputType type;
  int? num;

    TextFieldWidget({Key? key, required this.text1,
     required this.Controller,required this.hint,required this.type,  this.num}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  //TextEditingController Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
        child:
        TextFormField(
          maxLength: widget.num,
          validator: (value){
              if(value==null||value==''){
               return snackBar(widget.hint);
              }
              return null;
            },
          controller: widget.Controller,
          style: Theme.of(context).textTheme.bodyText1,
          keyboardType: widget.type,
          textInputAction: TextInputAction.next,
          textAlignVertical: TextAlignVertical.center,
          //readOnly: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            counter: Offstage(),
            //fillColor: Colors.grey[300],
            filled: true,
            hintText: widget.text1??"",
          ),
        ),
      ),

    );
  }

  snackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
