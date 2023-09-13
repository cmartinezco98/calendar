import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './modules/auth/auth.module';
import { UsersModule } from './modules/users/users.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [AuthModule, UsersModule, TypeOrmModule.forRoot({
    type: 'mysql',
    host: 'localhost',
    username: 'root',
    password: 'root',
    database: 'calendar',
    multipleStatements: true,
    entities: [],
    autoLoadEntities: true
  })],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
