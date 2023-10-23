import { Project } from "src/modules/projects/entities/project.entity";
import { TaskStatus } from "src/modules/task_status/entities/task_status.entity";
import { User } from "src/modules/users/entities/user.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryColumn } from "typeorm";

@Entity('tasks')
export class Task {
    @PrimaryColumn()
    k_task: number;
    @Column()
    n_description: string;
    @Column()
    fk_project: number;
    @Column()
    f_start: string;
    @Column()
    f_end: string;
    @Column()
    fk_status: number;
    @Column()
    fk_user_creator: number;
    @Column()
    fk_user_responsible: number;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;

    //Relaciones

    @ManyToOne((Type) => User, (userCreator) => userCreator.taskCreator)
    @JoinColumn({ name: 'fk_user_creator', referencedColumnName: 'k_user' })
    userCreator: User;

    @ManyToOne((Type) => User, (userResponsible) => userResponsible.taskResponsible)
    @JoinColumn({ name: 'fk_user_responsible', referencedColumnName: 'k_user' })
    userResponsible: User;

    @ManyToOne((Type) => TaskStatus, (taskStatus) => taskStatus.task)
    @JoinColumn({ name: 'fk_status', referencedColumnName: 'k_status' })
    taskStatus: TaskStatus;

    @ManyToOne((Type) => Project, (project) => project.tasks)
    @JoinColumn({ name: 'fk_project', referencedColumnName: 'k_project' })
    project: Project;
}
