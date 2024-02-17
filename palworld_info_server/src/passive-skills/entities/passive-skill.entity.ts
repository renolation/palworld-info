import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToMany,
  JoinTable,
  Unique,
  ManyToOne,
  OneToMany,
  JoinColumn,
} from 'typeorm';
import { LevelWorkSuitability } from '../../pals/entities/work_suitability.entity';
import { Pal } from '../../pals/entities/pal.entity';

@Entity()
@Unique(['name', 'isPositive'])
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

  @Column({ unique: true })
  name: string;

  @ManyToMany(() => PassiveDesc)
  @JoinTable()
  passiveDesc: PassiveDesc[];

  @OneToMany(() => PSkillPal, pSkillPal => pSkillPal.passiveSkill)
  pSkillPals: PSkillPal[];
}

@Entity()
@Unique(["passiveSkill", "rank"])  // The Unique decorator needs to include both fields
export class PSkillPal {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => PassiveSkill, passiveSkill => passiveSkill.pSkillPals)
  @JoinColumn()
  passiveSkill: PassiveSkill;

  @Column()
  rank: number;

  @ManyToMany(() => Pal, (pal) => pal.pSkillPals)
  pals: Pal[];
}