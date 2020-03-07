import 'package:asun_splash/customer_model.dart';
import 'package:asun_splash/material_search.dart';
import 'package:flutter/material.dart';


void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Search Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Nombre del cliente'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _names2 =  [
    CustomerModel(name: 'Alexander Mateo', code: '10'),
    CustomerModel(name: 'Juna Diego', code: '20'),
    CustomerModel(name: 'José Esteban', code: '30'),
    CustomerModel(name: 'Eduardo Santos', code: '40'),
    CustomerModel(name: 'Elena Tryan', code: '5'),
  ];

  String _name = 'No one';

  //final _formKey = GlobalKey<FormState>();

  _buildMaterialSearchPage(BuildContext context) {
    return MaterialPageRoute<CustomerModel>(
        settings: RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return Material(
            child: MaterialSearch<CustomerModel>(
              placeholder: 'Search usuario',
              results: _names2.map((CustomerModel v) => MaterialSearchResult<CustomerModel>(
                icon: Icons.person,
                value: v,
                text: v,
              )).toList(),
              filter: (CustomerModel value, CustomerModel criteria) {
                return value.name.toLowerCase().trim().contains(RegExp(r'' + criteria.name.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) => Navigator.of(context).pop(value),
              onSubmit: (dynamic value) => Navigator.of(context).pop(value),
            ),
          );
        }
    );
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() {
        CustomerModel customer = value;
        _name = customer.name;
        print(customer.toMap());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showMaterialSearch(context);
            },
            tooltip: 'X',
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
              child: Text("USER: ${_name ?? 'No one'}"),
            ),
            /*Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    MaterialSearchInput<String>(
                      placeholder: 'Cliente',
                      results: _names.map((String v) => MaterialSearchResult<String>(
                        icon: Icons.person,
                        value: v,
                        text: "RES2. $v",
                      )).toList(),
                      filter: (dynamic value, String criteria) {
                        return value.toLowerCase().trim()
                            .contains(RegExp(r'' + criteria.toLowerCase().trim() + ''));
                      },
                      onSelect: (dynamic v) {
                        print(v);
                      },
                      validator: (dynamic value) => value == null ? 'Required field' : null,
                      formatter: (dynamic v) => 'Hola, $v',
                    ),
                    MaterialButton(
                        child: Text('Validate'),
                        onPressed: () {
                          _formKey.currentState.validate();
                        }
                    ),
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMaterialSearch(context);
        },
        tooltip: 'Y',
        child: Icon(Icons.search),
      ),
    );
  }
}
