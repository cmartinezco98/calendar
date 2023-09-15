import { PartialType } from '@nestjs/mapped-types';
import { CreateTaskDto } from './create-task.dto';

export class UpdateTaskDto extends PartialType(CreateTaskDto) {
    k_task: number;
    n_description: string;
    fk_project: number;
    f_start: string;
    f_end: string;
    fk_status: number;
    fk_user_creator: number;
    fk_user_responsible: number;
}
