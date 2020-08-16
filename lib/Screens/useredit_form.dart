import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technology/Screens/userinfo_screen.dart';
import '../models/userinfo.dart';

class UserEditForm extends StatefulWidget {
  static const routeName = '/usereditform';
  @override
  _UserEditFormState createState() => _UserEditFormState();
}

class _UserEditFormState extends State<UserEditForm> {
  final _firstnamenode = FocusNode();
  final _lastnamenode = FocusNode();
  final _emailnode = FocusNode();
  final _phonenumbernode = FocusNode();
  final _professionnode = FocusNode();
  final _form = GlobalKey<FormState>();

  void _saveform() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
  }

  @override
  void dispose() {
    _firstnamenode.dispose();
    _lastnamenode.dispose();
    _emailnode.dispose();
    _phonenumbernode.dispose();
    _professionnode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _saveform();
                if (_form.currentState.validate()) {
                  Navigator.pop(context);
                }
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _form,
              child: Expanded(
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(letterSpacing: 1)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_firstnamenode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Plz provide your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        myMap['fullname'] = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Profession',
                          labelStyle: TextStyle(letterSpacing: 1)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      focusNode: _firstnamenode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_emailnode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Plz provide your profession';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        myMap['profession'] = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Gmail',
                          labelStyle: TextStyle(letterSpacing: 1)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: _emailnode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_phonenumbernode);
                      },
                      validator: (value) {
                        if (!value.contains('@gmail.com')) {
                          return 'Provide valid info';
                        }
                        if (value.isEmpty) {
                          return 'Plz provide your Gmail';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        myMap['email'] = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(letterSpacing: 1)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      focusNode: _phonenumbernode,
                      onFieldSubmitted: (_) {
                        _saveform();
                        Navigator.pop(context);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your number.';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        myMap['phonenumber'] = value;
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
