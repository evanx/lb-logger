import 'dart:async';
import 'package:redis/redis.dart';
import './RedisTransaction.dart';

class RedisClient {
  RedisConnection _conn = new RedisConnection();
  Command _command;

  RedisClient() {
  }

  connect({String host = 'localhost', int port = 6378}) async {
    _command = await _conn.connect(host, port);
  }

  Future<List> multi(fn) async {
    Transaction tx = await _command.multi();
    RedisTransaction rx = new RedisTransaction(tx);
    fn(rx);
    return await rx.exec();
  }

  Future close() {    
  }

}

