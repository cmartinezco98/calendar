import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    cors: { origin: "*", credentials: true, exposedHeaders: ['set-cookie'], methods: "GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS" },
  });
  await app.listen(3000);
}
bootstrap();
