import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class WorkSuitability {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    rank: number

    @Column({nullable: true})
    iconUrl: string

}
