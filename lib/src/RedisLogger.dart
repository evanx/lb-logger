import 'dart:async';
import './RedisClient.dart';

class RedisLogger {
   String name;
   RedisClient redis;

   RedisLogger(this.redis, this.name) {
   }

   Future info (message) async {
      const String level = 'INFO';
      String line = '${new DateTime.now().toString().substring(0, 19)} $level $message';
      print(line);
      List results = await redis.multi((rx) {
        rx.lpush('l:${name}:l', line);
        rx.ltrim('l:${name}:l', 0, 99);
        if (['WARN', 'ERROR'].contains(level)) {
          rx.lpush('l:${name}:${level}:l', line);
          rx.ltrim('l:${name}:${level}:l', 0, 99);
        }
        rx.hincrby('l:${name}:count:h', level, 1);
      });
   }
}

