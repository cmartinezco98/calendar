import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { hash } from 'bcrypt';
import { DeleteResult, In, Repository } from 'typeorm';
import { Role } from '../roles/entities/role.entity';
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
    @InjectRepository(Role)
    private roleRepository: Repository<Role>,
    @InjectRepository(User)
    private userRepository: Repository<User>
  ) { }

  async create(createDataUser: CreateUserDto) {
    const emailExist = await this.findOneByEmail(createDataUser.n_email);
    if (emailExist) {
      throw new HttpException('Error al crear usuario, Usuario existente', HttpStatus.BAD_REQUEST);
    }
    try {
      createDataUser.n_password = await hash(createDataUser.n_password, 10);

      const resCreateUser = await this.userRepository.create(createDataUser);
      const roles = await this.roleRepository.find({ where: { k_role: In(createDataUser.n_rol) } });
      const user: User = {
        ...resCreateUser,
        role: roles
      }
      const resSaveUser = await this.userRepository.save(user);
      return resSaveUser;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al crear el usuario`, HttpStatus.BAD_REQUEST);
    }
  }

  async findOneByEmail(email: string): Promise<User> {
    const user = await this.userRepository.findOne({ where: { n_email: email }, relations });
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


  async update(k_user: number, data: UpdateUserDto) {
    const { n_email, n_last_name, n_name, n_rol }: UpdateUserDto = data;
    console.log("id: ", k_user, "Data user:", data);
    await this.findOne(k_user);
    const resUpdateUser = await this.userRepository.update(k_user, { n_email, n_last_name, n_name });
    if (!resUpdateUser) throw new HttpException(`No se fue posible actualizar usuario: ${k_user}, Error de actualizacion`, HttpStatus.CONFLICT);

    const resCurrentRole = await this.userRepository.findOne({
      relations: {
        role: true
      },
      where: { k_user }
    })
    console.log(resCurrentRole);
    if (!resCurrentRole) throw new HttpException(`No se fue posible actualizar usuario: ${k_user}, Error de actualizacion`, HttpStatus.CONFLICT);

    resCurrentRole.role = resCurrentRole.role.filter((role) => {
      console.log(role.k_role);
  })

    return resUpdateUser;
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
