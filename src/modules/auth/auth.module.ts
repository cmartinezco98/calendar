import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';

@Module({
  imports: [
    JwtModule.register({
      secret: 'SemillaSecreta',
      signOptions: { expiresIn: '30 days' },
    }), PassportModule
  ],
  controllers: [AuthController],
  providers: [AuthService],
})
export class AuthModule { }
