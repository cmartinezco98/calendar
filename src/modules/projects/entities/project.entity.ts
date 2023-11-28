import { Client } from "src/modules/clients/entities/client.entity";
import { Task } from "src/modules/tasks/entities/task.entity";
import { User } from "src/modules/users/entities/user.entity";
import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryColumn } from "typeorm";
@Entity('projects')
export class Project {
    @PrimaryColumn()
    k_project: number;
    @Column()
    n_name: string;
    @Column()
    n_description: string;
    @Column()
    i_closed: number;
    @Column()
    fk_user: number;
    @Column()
    fk_client: number;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;

    //Relaciones
    @ManyToOne((Type) => User, (user) => user.project)
    @JoinColumn({ name: 'fk_user', referencedColumnName: 'k_user' })
    user: User;

    @ManyToOne((Type) => Client, (client) => client.project)
    @JoinColumn({ name: 'fk_client', referencedColumnName: 'k_client' })
    client: Client;

    @OneToMany((Type) => Task, (task) => task.project)
    tasks: Task[];
}
