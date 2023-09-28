import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { RolesService } from './roles.service';
import { CreateRoleDto } from './dto/create-role.dto';
import { UpdateRoleDto } from './dto/update-role.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';

@UseGuards(JwtAuthGuard)
@Controller('roles')
export class RolesController {
  constructor(private readonly rolesService: RolesService) { }

  @Post()
  create(@Body() createDataRole: CreateRoleDto) {
    return this.rolesService.create(createDataRole);
  }

  @Get()
  findAll() {
    return this.rolesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.rolesService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: number, @Body() updateDataRole: UpdateRoleDto) {
    return this.rolesService.update(id, updateDataRole);
  }

  @Delete(':id')
  remove(@Param('id') id: number) {
    return this.rolesService.remove(id);
  }
}
