import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateTaskDto } from './dto/create-task.dto';
import { UpdateTaskDto } from './dto/update-task.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Task } from './entities/task.entity';
import { Repository, UpdateResult } from 'typeorm';

@Injectable()
export class TasksService {
  constructor(
    @InjectRepository(Task)
    private taskRepository: Repository<Task>
  ) { }

  async create(createDataTask: CreateTaskDto): Promise<Task> {
    try {
      const resTaskCreate = await this.taskRepository.save(createDataTask);
      return resTaskCreate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al crear tarea`, HttpStatus.BAD_REQUEST);
    }
  }

  async findAll(): Promise<Task[]> {
    const resTasks = await this.taskRepository.find();
    return resTasks;
  }

  async findOne(k_task: number): Promise<Task> {
    const resTask = await this.taskRepository.findOneBy({ k_task });
    if (!resTask) throw new HttpException(`No se encuentra tarea con el ID ${k_task}`, HttpStatus.NOT_FOUND);
    return resTask;
  }

  async update(k_task: number, updateDataTask: UpdateTaskDto): Promise<UpdateResult> {
    await this.findOne(k_task);
    try {
      const resTaskUpdate = await this.taskRepository.update(k_task, updateDataTask);
      return resTaskUpdate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al actualizar tarea`, HttpStatus.BAD_REQUEST);
    }
  }

  async remove(k_task: number) {
    if (isNaN(k_task)) throw new HttpException(`Key no valida, Error al borrar tarea`, HttpStatus.BAD_REQUEST);
    await this.findOne(k_task);
    try {
      const res = {
        message: "Eliminado con exito",
        status: true
      };
      const resDelete = await this.taskRepository.delete(k_task);
      if (resDelete.affected == 0) {
        res.message = "No fue posible eliminar"
        res.status = false;
      }
      return res;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al borrar tarea`, HttpStatus.BAD_REQUEST);
    }
  }
}
