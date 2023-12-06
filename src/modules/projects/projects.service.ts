import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateProjectDto } from './dto/create-project.dto';
import { UpdateProjectDto } from './dto/update-project.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Project } from './entities/project.entity';
import { Repository, UpdateResult } from 'typeorm';

const relations = [
  'user',
  'client'
];

@Injectable()
export class ProjectsService {
  constructor(
    @InjectRepository(Project)
    private projectRepository: Repository<Project>
  ) { }

  async create(createDataProject: CreateProjectDto): Promise<Project> {
    try {
      const resProjectCreate = await this.projectRepository.save(createDataProject);
      return resProjectCreate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al crear proyecto`, HttpStatus.BAD_REQUEST);
    }
  }

  async findAll(): Promise<Project[]> {
    const resProjects = await this.projectRepository.find({ relations, order: { f_created_at: 'DESC' } });
    return resProjects;
  }

  async findAllOpen(): Promise<Project[]> {
    const resProjects = await this.projectRepository.find({ relations, order: { n_name: 'ASC' }, where: { i_closed: 0 } });
    return resProjects;
  }

  async findOne(k_project: number): Promise<Project> {
    const resProject = await this.projectRepository.findOne({ where: { k_project }, relations });
    if (!resProject) throw new HttpException(`No se encuentra proyecto con el ID ${k_project}`, HttpStatus.NOT_FOUND);
    return resProject;
  }

  async update(k_project: number, updateDataproject: UpdateProjectDto): Promise<UpdateResult> {
    await this.findOne(k_project);
    try {
      const resProjectUpdate = await this.projectRepository.update(k_project, updateDataproject);
      return resProjectUpdate;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al actualizar proyecto`, HttpStatus.BAD_REQUEST);
    }
  }

  async remove(k_project: number) {
    if (isNaN(k_project)) throw new HttpException(`Key no valida, Error al borrar proyecto`, HttpStatus.BAD_REQUEST);
    await this.findOne(k_project);
    try {
      const res = {
        message: "Eliminado con exito",
        status: true
      };
      const resDelete = await this.projectRepository.delete(k_project);
      if (resDelete.affected == 0) {
        res.message = "No fue posible eliminar"
        res.status = false;
      }
      return res;
    } catch (err) {
      throw new HttpException(`${err.sqlMessage}, Error al borrar proyecto`, HttpStatus.BAD_REQUEST);
    }
  }
}
