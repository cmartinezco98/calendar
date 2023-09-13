import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user.entity';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>
  ) { }

  async create(createDataUser: CreateUserDto): Promise<User> {
    try {
      const resCreateUser = await this.userRepository.save(createDataUser);
      console.log(resCreateUser);
      return resCreateUser;
    } catch (err) {
      throw new HttpException('Error al crear el usuario', HttpStatus.BAD_REQUEST);;
    }
  }

  async findOneByEmail(email: string): Promise<User> {
    const user = await this.userRepository.findOneBy({ n_email: email });
    return user;
  }


  findAll() {
    return `This action returns all users`;
  }

  findOne(id: number) {
    return `This action returns all users`;
  }


  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
