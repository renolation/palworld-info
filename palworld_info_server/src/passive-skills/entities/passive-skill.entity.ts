import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable, Unique } from 'typeorm';
import { LevelWorkSuitability } from '../../pals/entities/work_suitability.entity';

@Entity()
@Unique(["name", "isPositive"])
export class PassiveDesc {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  isPositive: boolean;
}

@Entity()
export class PassiveSkill {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({unique:true})
  name: string;

  @ManyToMany(() => PassiveDesc)
  @JoinTable()
  passiveDesc: PassiveDesc[];
}