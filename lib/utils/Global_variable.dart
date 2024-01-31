import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GlobalVariables {
  static String token = '';
  static String username = '';
  static List<File> mainImage = [];
  static List<File> mainImage2 = [];
  static double space = 0;
  static String reservationStart = '';
  static String reservationEnd = '';
  static String dragFlag = '';
  static String landingavatar = "";
  static String landingurl = "";
  static String landingname = "";
  static var memberlist = [];
  static List<String> messages = [];
  static var chatroom = [];
  static List<String> imageUrls = List.filled(21, '');
  static List<String> imageUrls1 = List.filled(21, '');
  static var idCard = [];
  static var channel = null;
  static var idCard1 = [];
  static int index = 0;
  static List<String> tabs = ['ビジネス', 'プライベート'];
  static List<Widget> tabScreens = [];

  static Future<void> getMember() async {
    var url = Uri.parse('http://194.87.199.12:5000/social/private/contactdata');
    var object = {'Authorization': 'token ${token}'};
    final response = await http.get(url, headers: object);
    if (response.statusCode == 200) {
      // Logout successful, clear user-related data or tokens
      memberlist = json.decode(response.body);
    } else {
      // Handle error
    }
  }

  static Future<void> getRoom() async {
    var url = Uri.parse('http://194.87.199.12:5000/social/private/chatroom');
    var object = {'Authorization': 'token ${token}'};
    final response = await http.get(url, headers: object);
    if (response.statusCode == 200) {
      // Logout successful, clear user-related data or tokens
      chatroom = json.decode(response.body);
    } else {
      // Handle error
    }
  }

  static Future<void> uploadToCloudinary(
      String pathimage, int index, int identify) async {
    final cloudName = 'dz6r3o4w0'; // Replace with your Cloudinary cloud name
    final unsignedUploadPreset =
        'dfuqz9xv'; // Replace with your upload preset name
    final file = File(pathimage); // Replace with the actual path to your image

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dz6r3o4w0/upload');
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = unsignedUploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      final url = jsonMap['url'];
      if (identify == 1) {
        imageUrls[index] = url;
        if (index == 1) idCard.add(imageUrls[index]);
      } else {
        imageUrls1[index] = url;
        if (index == 1) idCard1.add(imageUrls1[index]);
      }
    }
  }
}
