import { Column, Entity, PrimaryColumn } from "typeorm";
@Entity('projects')
export class Project {
    @PrimaryColumn()
    k_project: number;
    @Column()
    n_name: string;
    @Column()
    n_description: string;
    @Column()
    fk_user: number;
    @Column()
    fk_client: number;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;
}
