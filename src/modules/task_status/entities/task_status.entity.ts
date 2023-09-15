import { Column, Entity, PrimaryColumn } from "typeorm";

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
}
