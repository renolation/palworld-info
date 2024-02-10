import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable } from 'typeorm';
import { LevelWorkSuitability } from './work_suitability.entity';

@Entity()
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

  @Column()
  name: string;

  @ManyToMany(() => PassiveDesc)
  @JoinTable()
  passiveDesc: PassiveDesc[];
}