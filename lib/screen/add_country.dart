import 'package:flutter/material.dart';

import 'package:countries/provider/data.dart';
import 'package:countries/provider/all_data_provider.dart';
import 'package:provider/provider.dart';

class AddCountry extends StatefulWidget {
  const AddCountry({super.key});

  @override
  State<AddCountry> createState() => _AddCountryState();
}

class _AddCountryState extends State<AddCountry> {
  final _form = GlobalKey<FormState>();
  final _countryNode = FocusNode();
  var _addCountry = Country(flag: '', country: '', like: false);

  @override
  Widget build(BuildContext context) {
    final countries = Provider.of<AllDataProvider>(context);

    saveForm() {
      final isValidate = _form.currentState?.validate();
      if (!isValidate!) {
        return null;
      }

      _form.currentState?.save();

      if (countries.countries
          .where((element) => element.flag == _addCountry.flag)
          .isNotEmpty) {
        return showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: const Text("You have added it before"),
                actions: [
                  TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text("Cancel"))
                ],
              );
            }));
      }
      countries.addCountry(_addCountry);
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: Text(
            "Add Country",
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: saveForm,
            )
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/add.png",
                fit: BoxFit.contain,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: TextFormField(
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).accentColor)),
                                hintText: "Country's Image Link",
                                hintStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.blue))),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_countryNode);
                            },
                            onSaved: (value) {
                              _addCountry = Country(
                                  flag: value.toString(),
                                  country: '',
                                  like: false);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "put image for you country";
                              }
                              return null;
                            },
                          ),
                        ),
                        TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              hintText: "Country's Name",
                              hintStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.blue))),
                          textInputAction: TextInputAction.done,
                          focusNode: _countryNode,
                          onSaved: (value) {
                            _addCountry = Country(
                                flag: _addCountry.flag,
                                country: value.toString(),
                                like: _addCountry.like);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Fill Country Name Field";
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
