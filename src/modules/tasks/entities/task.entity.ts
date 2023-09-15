import { Column, Entity, NumericType, PrimaryColumn } from "typeorm";

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
    @Column()
    fk_user_responsible: number;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;
}
