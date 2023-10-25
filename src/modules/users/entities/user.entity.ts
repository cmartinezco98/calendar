import { Project } from "src/modules/projects/entities/project.entity";
import { Role } from "src/modules/roles/entities/role.entity";
import { Task } from "src/modules/tasks/entities/task.entity";
import { Collection, Column, Entity, JoinTable, ManyToMany, OneToMany, PrimaryColumn } from "typeorm";

@Entity('users')
export class User {
    @PrimaryColumn()
    k_user: number;

    @Column()
    n_name: string;

    @Column()
    n_last_name: string;

    @Column()
    n_email: string;

    @Column()
    n_password: string;

    @Column()
    f_created_at: string;

    @Column()
    f_updated_at: string;

    //Relaciones

    @OneToMany((Type) => Project, (project) => project.user)
    project: Project[];

    @OneToMany((Type) => Task, (task) => task.userCreator)
    taskCreator: Task[];

    @OneToMany((Type) => Task, (task) => task.userCreator)
    taskResponsible: Task[];

    @ManyToMany((type) => Role, (role) => role.user)
    @JoinTable({
        name: 'user_role',
        joinColumn: {
            name: ' fk_user',
        },
        inverseJoinColumn: {
            name: ' fk_role',
        },
    })
    role: Role[];
}

