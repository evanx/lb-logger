import 'package:lb_logger/lb_logger.dart';

main() async {
  RedisClient redisClient = new RedisClient();
  redisClient.connect();
  RedisLogger logger = new RedisLogger(redisClient, 'mylogger');
  print('logger ${logger.name}');
  logger.info('some info');
  redisClient.close();
}
