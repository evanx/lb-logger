import 'package:redis_client/redis_client.dart';

class RedisLogger {
   String name;
   RedisClient redisClient;

   RedisLogger(this.redisClient, this.name) {
   }

   void info(message) {
      const String level = 'INFO';
      String line = '${new DateTime.now().toString().substring(0, 19)} $level $message';
      print(line);
      redisClient.lpush('logger:$name:l', line);
      redisClient.ltrim('logger:$name:l', 0, 99);
      redisClient.hincrby('logger:$name:count:h', level, 1);
      redisClient.hincrby('logger:$name:count:$level:h', new DateTime.now().hour.toString(), 1);
   }
}

