import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, ManyToMany, OneToMany } from "typeorm";
import { Element } from "../../pals/entities/element.entity";
import { Pal } from "../../pals/entities/pal.entity";
import { ActiveSkillPal } from "./active_skill_pal.entity";



@Entity()
export class ActiveSkill {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  power: number;

  @Column()
  cd: number;

  @Column()
  desc: string;

  @ManyToOne(() => Element, element => element.activeSkills)
  @JoinColumn()
  element: Element;

  @OneToMany(() => ActiveSkillPal, (activeSkillsPal) => activeSkillsPal.activeSkill)
  activeSkillPal: ActiveSkillPal;


}

