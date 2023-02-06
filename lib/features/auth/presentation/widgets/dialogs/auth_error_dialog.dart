import 'package:flutter/material.dart';

class AuthErrorDialog extends StatefulWidget {
  const AuthErrorDialog({Key? key, required this.errors}) : super(key: key);
 final List<String> errors ;

  @override
  State<AuthErrorDialog> createState() => _AuthErrorDialogState();
}

class _AuthErrorDialogState extends State<AuthErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // const Center(child: Text('Something went wrong!!',style: TextStyle(fontFamily: 'Poppins',fontSize:16,fontWeight: FontWeight.bold ),)),
        ...List.generate(widget.errors.length, (index) =>    Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children:  [
              const Icon(
                Icons.info,
                color: Colors.white,
                size: 18,

              ),
              const  SizedBox(
                width: 8,
              ),
              Expanded(child: Text(widget.errors[index],style: const TextStyle(fontSize: 14,fontFamily: 'Poppins'),)),

            ],
          ),
        ))
      ],
    );
  }
}
