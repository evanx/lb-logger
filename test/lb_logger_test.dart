import 'package:redis_client/redis_client.dart';
import 'package:lb_logger/lb_logger.dart';
import 'package:test/test.dart';

void main() {
  group('[redis logger test group]', () {
    RedisClient redisClient;
    RedisLogger logger;

    setUp(() async {
      redisClient = await RedisClient.connect();
      logger = new RedisLogger(redisClient, 'mylogger');
    });

    tearDown(() async {
      redisClient.close();
    });

    test('logger.name', () {
      expect(logger.name, 'mylogger');
    });
  });
}
