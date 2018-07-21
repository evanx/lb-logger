import 'package:lb_logger/lb_logger.dart';
import 'package:test/test.dart';

void main() {
  group('[redis logger test group]', () {
    RedisClient redisClient = new RedisClient();
    RedisLogger logger;

    setUp(() async {
      await redisClient.connect();
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
