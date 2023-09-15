import { Column, Entity, PrimaryColumn } from "typeorm";

@Entity('roles')
export class Role {
    @PrimaryColumn()
    k_role: number;
    @Column()
    n_name: string;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;
}
