import { Task } from "src/modules/tasks/entities/task.entity";
import { Column, Entity, OneToMany, PrimaryColumn } from "typeorm";

@Entity('task_status')
export class TaskStatus {
    @PrimaryColumn()
    k_status: number;
    @Column()
    n_name: string;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;

    //Relaciones

    @OneToMany((Type) => Task, (task) => task.taskStatus)
    task: Task[];
}
