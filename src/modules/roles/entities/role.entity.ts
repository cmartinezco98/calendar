import { User } from "src/modules/users/entities/user.entity";
import { Column, Entity, JoinTable, ManyToMany, PrimaryColumn } from "typeorm";

@Entity('roles')
export class Role {
    @PrimaryColumn()
    k_role: number;
    @Column()
    n_name: string;
    @Column()
    f_created_at?: string;
    @Column()
    f_updated_at?: string;

    //Relaciones

    @ManyToMany((type) => User, (user) => user.role, { cascade: true })
    user: User[];
}
