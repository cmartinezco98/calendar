import { Body, Controller, Get, Post } from '@nestjs/common';
import { CreateUserDto } from '../users/dto/create-user.dto';
import { AuthService } from './auth.service';
import { LoginAuthDto } from './dto/login-auth.dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) { }

  @Post('signin')
  create(@Body() createUserDto: CreateUserDto) {
    return this.authService.authSignin(createUserDto);
  }

  @Post('login')
  authLogin(@Body() dataUser: LoginAuthDto): object {
    console.log(dataUser);
    return this.authService.authLogin(dataUser);
  }
}
