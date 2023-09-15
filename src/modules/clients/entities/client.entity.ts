import { Column, Entity, PrimaryColumn } from "typeorm";
@Entity('clients')
export class Client {
    @PrimaryColumn()
    k_client: number;
    @Column()
    n_name: string;
    @Column()
    f_created_at: string;
    @Column()
    f_updated_at: string;
}
