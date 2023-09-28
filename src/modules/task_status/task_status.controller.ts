import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { TaskStatusService } from './task_status.service';
import { CreateTaskStatusDto } from './dto/create-task_status.dto';
import { UpdateTaskStatusDto } from './dto/update-task_status.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';

@UseGuards(JwtAuthGuard)
@Controller('task-status')
export class TaskStatusController {
  constructor(private readonly taskStatusService: TaskStatusService) { }

  @Post()
  create(@Body() createDataTaskStatus: CreateTaskStatusDto) {
    return this.taskStatusService.create(createDataTaskStatus);
  }

  @Get()
  findAll() {
    return this.taskStatusService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.taskStatusService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: number, @Body() updateDataTaskStatus: UpdateTaskStatusDto) {
    return this.taskStatusService.update(id, updateDataTaskStatus);
  }

  @Delete(':id')
  remove(@Param('id') id: number) {
    return this.taskStatusService.remove(id);
  }
}
