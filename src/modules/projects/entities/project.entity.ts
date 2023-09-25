import { Client } from "src/modules/clients/entities/client.entity";
import { User } from "src/modules/users/entities/user.entity";
import { Column, Entity, PrimaryColumn, ManyToOne, JoinColumn } from "typeorm";
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

    //Relaciones
    @ManyToOne((Type) => User, (user) => user.project)
    @JoinColumn({ name: 'fk_user', referencedColumnName: 'k_user' })
    user: User;

    @ManyToOne((Type) => Client, (client) => client.project)
    @JoinColumn({ name: 'fk_client', referencedColumnName: 'k_client' })
    client: Client;

}
