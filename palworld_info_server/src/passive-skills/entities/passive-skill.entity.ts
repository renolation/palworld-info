import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable, Unique, ManyToOne, OneToMany } from 'typeorm';
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
export class PSkillPal {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => PassiveSkill, passiveSkill => passiveSkill.pSkillPals)
  passiveSkill: PassiveSkill;

  @Column({ unique: true })
  rank: number;

  // @OneToMany(() => Pal, (pal) => pal.passiveSkill)
  // pal: Pal[];
}