import 'dart:async';
import 'package:redis/redis.dart';

class RedisTransaction {
  Transaction _tx;

  RedisTransaction(this._tx);

  void lpush(String key, String value) {
    _tx.send_object(["lpush", key, value]);

  }

  void ltrim(String key, int start, int stop) {
    _tx.send_object(["ltrim", key, start, stop]);
   
  }

  void hincrby(String key, String field, int increment) {
    _tx.send_object(["hincrby", key, field, increment]);
  }

  Future<List> exec() async {
    return _tx.exec();
  }

}
