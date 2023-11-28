import { PartialType } from '@nestjs/mapped-types';
import { CreateUserDto } from './create-user.dto';

export class UpdateUserDto {
    n_name?: string;
    n_last_name?: string;
    n_email?: string;
    n_rol?: [number];
}
