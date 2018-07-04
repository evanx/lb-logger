import 'package:redis_client/redis_client.dart';
import 'package:lb_logger/lb_logger.dart';

main() async {
  RedisClient redisClient = await RedisClient.connect();
  RedisLogger logger = new RedisLogger(redisClient, 'mylogger');
  print('logger ${logger.name}');
  redisClient.close();
}
