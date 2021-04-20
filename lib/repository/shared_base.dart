import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositeryShared {

    saveSeenScreen({bool seen}) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool('seen', seen);
    }

    Future<bool> getSeenScreen() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        var seen = await sharedPreferences.getBool('seen');
        return seen;
    }

    Future<bool> removeSeenScreen() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.remove('seen');
    }

    saveUserID(Map<String, dynamic> user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('id', user['id'].toString());
    }

    saveUserGender(Map<String, dynamic> user) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString('flag_sexe ', user['id'].toString());
    }

    getUserID() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String id = sharedPreferences.getString('id');
        print('------ GET ID $id ---------');
        return id;
    }

    saveMosqueID({String id_mosque}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.remove('id_mosque');
        await sharedPreferences.setString('id_mosque', id_mosque);
    }

    getMosqueID() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String id = sharedPreferences.getString('id_mosque');
        return id;
    }

    saveRelaionID({String id_relation}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.remove('id_relation');
        await sharedPreferences.setString('id_relation', id_relation);
    }

    getRelationID() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String id = sharedPreferences.getString('id_relation');
        return id;
    }

    saveGroupeIndex({int id_groupe}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.remove('id_groupe');
        await sharedPreferences.setInt('id_groupe', id_groupe);
    }

    getGroupeIndex() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        int id = sharedPreferences.getInt('id_groupe');
        return id;
    }

    saveBooking({String prayername, bool book}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.remove('book');
        await sharedPreferences.remove('prayername');
        await sharedPreferences.setBool('book', book);
        await sharedPreferences.setString('prayername', prayername);
    }

    getBookingPrayer() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String prayername = sharedPreferences.getString('prayername');
        return prayername;
    }

    getBookingStatus() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        bool book = sharedPreferences.getBool('book');
        return book;
    }

    saveBarCode({String barcode}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.remove('barcode');
        await sharedPreferences.setString('barcode', barcode);
    }

    getBarCode() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String barcode = sharedPreferences.getString('barcode');
        return barcode;
    }
}