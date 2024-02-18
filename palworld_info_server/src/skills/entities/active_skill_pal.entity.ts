import { Column, Entity, ManyToMany, ManyToOne, PrimaryGeneratedColumn, Unique } from "typeorm";
import { Pal } from "../../pals/entities/pal.entity";
import { ActiveSkill } from "./active_skill.entity";

@Entity()
@Unique(["range", "level", "activeSkill"])
export class ActiveSkillPal {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  range: string;

  @Column()
  level: number;

  @ManyToOne(() => ActiveSkill, (activeSkill) => activeSkill.activeSkillPal)
  activeSkill: ActiveSkill;

  @ManyToMany(() => Pal, (pal) => pal.activeSkillsPal)
  pals: Pal[];
}