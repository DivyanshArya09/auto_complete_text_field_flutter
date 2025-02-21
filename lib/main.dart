import 'package:auto_complete_text_field_flutter/constants/constants.dart';
import 'package:auto_complete_text_field_flutter/textfield/auto_complete_text_field.dart';
import 'package:auto_complete_text_field_flutter/themes/text_field_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: CustomTextFieldTheme.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _stateTC, _cityTC;
  late FocusNode _stateFN, _cityFocusNode;
  List<String> _cityOptions = [];

  @override
  void initState() {
    _stateTC = TextEditingController();
    _cityTC = TextEditingController();
    _stateFN = FocusNode();
    _cityFocusNode = FocusNode();
    _stateFN.addListener(() {
      if (_stateFN.hasFocus) {
        _cityTC.clear();
      }
    });
    super.initState();
  }

  void _updateCityOptions(String option) {
    setState(() {
      _cityOptions = indiaStatesAndDistricts[option] ?? [];
    });
  }

  @override
  void dispose() {
    _stateTC.dispose();
    _cityTC.dispose();
    _stateFN.dispose();
    _cityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Auto Complete Text field'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            CustomAutocompleteTextField(
              controller: _stateTC,
              focusNode: _stateFN,
              hintText: 'Select states',
              onSubmitted: (p0) {
                _updateCityOptions(p0);
                _cityTC.clear();
                _stateFN.nextFocus();
              },
              options: indiaStatesAndDistricts.keys.toSet(),
            ),
            const SizedBox(height: 20),
            CustomAutocompleteTextField(
              controller: _cityTC,
              focusNode: _cityFocusNode,
              hintText: 'Select city',
              options: _cityOptions.isEmpty
                  ? {"NO options available"}
                  : _cityOptions.toSet(),
            ),
          ],
        ),
      ),
    );
  }
}
