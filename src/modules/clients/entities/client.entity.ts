import { Project } from "src/modules/projects/entities/project.entity";
import { Column, Entity, OneToMany, PrimaryColumn } from "typeorm";
@Entity('clients')
export class Client {
    @PrimaryColumn()
    k_client: number;
    @Column()
    n_name: string;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;

    //Relaciones
    //Clientes - Proyectos 1 a N 

    @OneToMany((Type) => Project, (project) => project.client)
    project: Project[];
}
