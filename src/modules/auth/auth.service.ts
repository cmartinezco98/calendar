import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { User } from '../users/entities/user.entity';
import { UsersService } from '../users/users.service';
import { CreateAuthDto } from './dto/create-auth.dto';
import { LoginAuthDto } from './dto/login-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { CreateUserDto } from '../users/dto/create-user.dto';



@Injectable()
export class AuthService {
  constructor(private jwtTokenService: JwtService, private usersService: UsersService) { }

  private data: LoginAuthDto = {
    token: "",
    result: ""
  };

  async JWTGenerator(payload: User) {

    const token = await this.jwtTokenService.sign({
      k_user: payload.k_user,
      n_name: payload.n_name,
      n_email: payload.n_email
    });
    this.data.token = token;
    this.data.result = "Inicio de sesion exitoso"
  }

  async authSignin(dataCreateUser: CreateUserDto): Promise<object> {
    const resUser: User = await this.usersService.create(dataCreateUser);
    if (resUser) {
      this.JWTGenerator(resUser);
    } else {
      this.data.token = "";
      this.data.result = "Error al crear usuario"
    }
    return this.data;
  }

  async authLogin({ n_email, n_password }: LoginAuthDto): Promise<object> {
    const resUser: User = await this.usersService.findOneByEmail(n_email);
    if (resUser) {
      if (resUser.n_email == n_email && resUser.n_password == n_password) {
        this.JWTGenerator(resUser);
      } else {
        this.data.token = "";
        this.data.result = "Usuario o contraseña incorrectas"
      }
    }
    else {
      this.data.token = "";
      this.data.result = "Usuario no existe"
    }
    return this.data;
  }




  create(createAuthDto: CreateAuthDto) {
    return 'This action adds a new auth';
  }

  findAll() {
    return `This action returns all auth`;
  }

  findOne(id: number) {
    return `This action returns a #${id} auth`;
  }

  update(id: number, updateAuthDto: UpdateAuthDto) {
    return `This action updates a #${id} auth`;
  }

  remove(id: number) {
    return `This action removes a #${id} auth`;
  }
}
