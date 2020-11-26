import 'dart:async';
import 'dart:ffi';

import 'package:flutter_tech_posts_trending/models/post_repo.dart';
import 'package:flutter_tech_posts_trending/models/user.dart';
import 'package:flutter_tech_posts_trending/network/service.dart';

class Api {
  Future<List<PostRepo>> postTrending() async {
    var c = Completer<List<PostRepo>>();
    try {
      var response = await Service.instance.dio.get(
        '/posts',
      );
      var result = PostRepo.parseRepoList(response.data);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<Void> bookmark(String repoName) async {
    var c = Completer<Void>();
    try {
      var response = await Service.instance.dio.post(
        '/bookmark/add',
        data: {
          'repo': repoName,
        },
      );
      if (response.statusCode == 200) {
        c.complete();
      }
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<Void> delBookmark(String repoName) async {
    var c = Completer<Void>();
    try {
      var response = await Service.instance.dio.delete(
        '/bookmark/delete',
        data: {
          'repo': repoName,
        },
      );
      if (response.statusCode == 200) {
        c.complete();
      }
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<List<PostRepo>> listBookmarks() async {
    var c = Completer<List<PostRepo>>();
    try {
      var response = await Service.instance.dio.get('/bookmark/list');
      if (response.statusCode == 200) {
        var result = PostRepo.parseRepoList(response.data);
        c.complete(result);
      }
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<User> profile() async {
    var c = Completer<User>();
    try {
      var response = await Service.instance.dio.get('/user/profile');
      if (response.statusCode == 200) {
        var result = User.fromJson(response.data['data']);
        c.complete(result);
      }
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<User> updateProfile(User user) async {
    var c = Completer<User>();
    try {
      var response = await Service.instance.dio.put(
        '/user/profile/update',
        data: {
          'fullName': user.fullName,
          'email': user.email,
          'password': user.password,
        },
      );
      var result = User.fromJson(response.data['data']);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<User> signIn(String email, String password) async {
    var c = Completer<User>();
    try {
      var response = await Service.instance.dio.post(
        '/user/sign-in',
        data: {
          'email': email,
          'password': password,
        },
      );
      var result = User.fromJson(response.data['data']);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<User> signUp(String email, String password, String fullName) async {
    var c = Completer<User>();
    try {
      var response = await Service.instance.dio.post(
        '/user/sign-up',
        data: {
          'email': email,
          'password': password,
          'fullName': fullName,
        },
      );
      var result = User.fromJson(response.data['data']);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }
}