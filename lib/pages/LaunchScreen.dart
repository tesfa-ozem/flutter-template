import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/models/LaunchModel.dart';
import 'package:provider/provider.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<MyModel>(
        create: (context) => MyModel(),
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('My App')),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>(builder: (BuildContext context, MyModel myModel, Widget child) {
                    return RaisedButton(
                      child: Text('Do something'),
                      onPressed: () {
                        myModel.doSomething();
                      },
                    );
                  },

                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.blue[200],
                  child: Consumer<MyModel>( //                    <--- Consumer
                    builder: (context, myModel, child) {
                      return Text(myModel.someValue);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
