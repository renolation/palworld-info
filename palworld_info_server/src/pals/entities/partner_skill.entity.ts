import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class PartnerSKill {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string
    
    @Column()
    rank: number

    @Column({nullable: true})
    iconUrl: string

}
