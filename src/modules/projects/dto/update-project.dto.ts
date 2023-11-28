import { PartialType } from '@nestjs/mapped-types';
import { CreateProjectDto } from './create-project.dto';

export class UpdateProjectDto extends PartialType(CreateProjectDto) {
    k_project: number;
    n_name?: string;
    n_description?: string;
    fk_user?: number;
    fk_client?: number;
    i_closed: number;
}
