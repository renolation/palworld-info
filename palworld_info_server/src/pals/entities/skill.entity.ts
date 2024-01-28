import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class Skill {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string
    
    @Column()
    level: number

    @Column({nullable: true})
    iconUrl: string

}
