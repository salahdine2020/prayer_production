import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositeryShared {
    saveUserID(Map<String, dynamic> user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('id', user['id'].toString());
    }
    getUserID() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String id = sharedPreferences.getString('id');
        print('------ GET ID $id ---------');
        return id;
    }
}