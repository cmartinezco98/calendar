import { Collection, Column, Entity, PrimaryColumn } from "typeorm";

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

}
