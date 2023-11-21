import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { compare, hash } from 'bcrypt';
import { CreateUserDto } from '../users/dto/create-user.dto';
import { User } from '../users/entities/user.entity';
import { UsersService } from '../users/users.service';
import { LoginAuthDto } from './dto/login-auth.dto';
import { Role } from '../roles/entities/role.entity';

@Injectable()
export class AuthService {
  constructor(private jwtTokenService: JwtService, private usersService: UsersService) { }

  private data: LoginAuthDto = {
    token: "",
    result: ""
  };

  async JWTGenerator(payload: User) {
    let roles = payload.role.map((role: Role) => {
      return role.n_name
    });

    const token = await this.jwtTokenService.sign({
      k_user: payload.k_user,
      n_name: payload.n_name,
      n_email: payload.n_email,
      roles: roles
    });
    this.data.token = token;
    this.data.result = "Inicio de sesion exitoso"
  }

  async authSignin(dataCreateUser: CreateUserDto): Promise<object> {
    dataCreateUser.n_password = await hash(dataCreateUser.n_password, 10);
    let resUser: User = await this.usersService.create(dataCreateUser);
    if (resUser) {
      resUser = await this.usersService.findOneByEmail(resUser.n_email);
    }
    return this.data;
  }

  async authLogin({ n_email, n_password }: LoginAuthDto): Promise<object> {
    const resUser: User = await this.usersService.findOneByEmail(n_email);
    if (resUser) {
      const match = await compare(n_password, resUser.n_password);
      if (resUser.n_email == n_email && match) {
        this.JWTGenerator(resUser);
      } else { throw new HttpException('Usuario o contraseña incorrecta', HttpStatus.BAD_REQUEST); }
    } else { throw new HttpException('Usuario o contraseña incorrecta', HttpStatus.NOT_FOUND); }
    return this.data;
  }
}
