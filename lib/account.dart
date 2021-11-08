import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Account> {
  int value = 0;
  final first = TextEditingController();
  final second = TextEditingController();

  @override
  void dispose() {
    first.dispose();
    second.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: first,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'First Number'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: second,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Second Number'
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
                "$value",
                style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              child: Text(
                  "Calculate",
                  style:TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                  )
              ),
              onTap: (){
                setState(() {
                  if(int.parse(first.text) > int.parse(second.text)){
                    value = int.parse(second.text);
                  }else{
                    value = int.parse(first.text);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
