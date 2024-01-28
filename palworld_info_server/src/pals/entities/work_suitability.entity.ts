import { Entity, PrimaryGeneratedColumn, Column, JoinColumn, ManyToOne } from "typeorm";

@Entity()
export class WorkSuitability {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column({nullable: true})
    iconUrl: string

}

@Entity()
export class LevelWorkSuitability {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => WorkSuitability)
    @JoinColumn({ name: 'workSuitabilityId' })
    workSuitability: WorkSuitability;

    @Column()
    level: number
}

