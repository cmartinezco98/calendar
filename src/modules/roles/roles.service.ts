import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateRoleDto } from './dto/create-role.dto';
import { UpdateRoleDto } from './dto/update-role.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Role } from './entities/role.entity';
import { Repository, UpdateResult } from 'typeorm';

@Injectable()
export class RolesService {
  constructor(
    @InjectRepository(Role)
    private roleRepository: Repository<Role>
  ) { }

  async create(createDataRole: CreateRoleDto): Promise<Role> {
    try {
      const resRoleCreate = await this.roleRepository.save(createDataRole);
      return resRoleCreate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al crear rol`, HttpStatus.BAD_REQUEST);
    }
  }

  async findAll(): Promise<Role[]> {
    const resRoles = await this.roleRepository.find();
    return resRoles;
  }

  async findOne(k_role: number): Promise<Role> {
    const resRole = await this.roleRepository.findOneBy({ k_role });
    if (!resRole) throw new HttpException(`No se encuentra rol con el ID ${k_role}`, HttpStatus.NOT_FOUND);
    return resRole;
  }

  async update(k_role: number, updateDataRole: UpdateRoleDto): Promise<UpdateResult> {
    await this.findOne(k_role);
    try {
      const resRoleUpdate = await this.roleRepository.update(k_role, updateDataRole);
      return resRoleUpdate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al actualizar rol`, HttpStatus.BAD_REQUEST);
    }
  }

  async remove(k_role: number) {
    if (isNaN(k_role)) throw new HttpException(`Key no valida, Error al borrar rol`, HttpStatus.BAD_REQUEST);
    await this.findOne(k_role);
    try {
      const res = {
        message: "Eliminado con exito",
        status: true
      };
      const resDelete = await this.roleRepository.delete(k_role);
      if (resDelete.affected == 0) {
        res.message = "No fue posible eliminar"
        res.status = false;
      }
      return res;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al borrar rol`, HttpStatus.BAD_REQUEST);
    }
  }
}
