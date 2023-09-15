import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateTaskStatusDto } from './dto/create-task_status.dto';
import { UpdateTaskStatusDto } from './dto/update-task_status.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { TaskStatus } from './entities/task_status.entity';
import { Repository, UpdateResult } from 'typeorm';

@Injectable()
export class TaskStatusService {
  constructor(
    @InjectRepository(TaskStatus)
    private taskstatusRepository: Repository<TaskStatus>
  ) { }
  async create(createDataTaskStatus: CreateTaskStatusDto): Promise<TaskStatus> {
    try {
      const resTaskStatusCreate = await this.taskstatusRepository.save(createDataTaskStatus);
      return resTaskStatusCreate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al crear estatus`, HttpStatus.BAD_REQUEST);
    }
  }

  async findAll(): Promise<TaskStatus[]> {
    const resTaskStatuss = await this.taskstatusRepository.find();
    return resTaskStatuss;
  }

  async findOne(k_status: number): Promise<TaskStatus> {
    const resTaskStatus = await this.taskstatusRepository.findOneBy({ k_status });
    if (!resTaskStatus) throw new HttpException(`No se encuentra estatus con el ID ${k_status}`, HttpStatus.NOT_FOUND);
    return resTaskStatus;
  }

  async update(k_status: number, updateDataTaskStatus: UpdateTaskStatusDto): Promise<UpdateResult> {
    await this.findOne(k_status);
    try {
      const resTaskStatusUpdate = await this.taskstatusRepository.update(k_status, updateDataTaskStatus);
      return resTaskStatusUpdate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al actualizar estatus`, HttpStatus.BAD_REQUEST);
    }
  }

  async remove(k_status: number) {
    if (isNaN(k_status)) throw new HttpException(`Key no valida, Error al borrar estatus`, HttpStatus.BAD_REQUEST);
    await this.findOne(k_status);
    try {
      const res = {
        message: "Eliminado con exito",
        status: true
      };
      const resDelete = await this.taskstatusRepository.delete(k_status);
      if (resDelete.affected == 0) {
        res.message = "No fue posible eliminar"
        res.status = false;
      }
      return res;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al borrar status`, HttpStatus.BAD_REQUEST);
    }
  }
}
