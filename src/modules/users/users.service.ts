import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DeleteResult, Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user.entity';

const relations = [
  'project',
  'taskCreator',
  'taskResponsible',
  'role'
];

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>
  ) { }

  async create(createDataUser: CreateUserDto): Promise<User> {
    try {
      const resCreateUser = await this.userRepository.save(createDataUser);
      return resCreateUser;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al crear el usuario`, HttpStatus.BAD_REQUEST);
    }
  }

  async findOneByEmail(email: string): Promise<User> {
    const user = await this.userRepository.findOneBy({ n_email: email });
    return user;
  }


  async findAll(): Promise<User[]> {
    return await this.userRepository.find({ relations });
  }

  async findOne(k_user: number): Promise<User> {
    const user = await this.userRepository.findOne({
      where: { k_user },
      relations,
    });
    if (!user) throw new HttpException(`No se encuentra el usuario con el ID: ${k_user}, Error de busqueda`, HttpStatus.NOT_FOUND);
    return user;
  }


  update(id: number, data: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  async remove(k_user: number): Promise<DeleteResult> {
    await this.findOne(k_user);
    try {
      const res = await this.userRepository.delete(k_user);
      return res;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al eliminar`, HttpStatus.BAD_REQUEST);
    }
  }
}
