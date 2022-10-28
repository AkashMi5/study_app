import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:study_app/screens/create_test/models/topics.dart';

class TestTopicRepository {
  ///first api called in preKyc module to fetch all the preKyc status and show them on home screen
  Future<dynamic> getTopics() async {
    List<Topic> topics = [];

    final url = Uri.parse(
        'https://utkwwq6r95.execute-api.us-east-1.amazonaws.com/assignment/topics');
    String token = 'd61036c6-5ffd-4964-b7ff-8d5ba8ca0262';
    String userId = '25794905-2dd4-40bd-97b9-9d5d69294b86';

    try {
      final response = await http.get(
        url,
        headers: {'token': token, 'userid': userId},
      );

      var map = jsonDecode(response.body);
      map.forEach((e) => topics.add(Topic.fromJson(e)));
      debugPrint(topics[0].topicName);
      //  topics = Topic.fromJson(map);
      return topics;
    } catch (e, error) {
      debugPrint(error.toString());
    }
  }
}
