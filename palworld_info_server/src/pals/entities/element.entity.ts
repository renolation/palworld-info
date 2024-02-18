import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import { ActiveSkill } from "../../passive-skills/entities/active_skill.entity";

@Entity()
export class Element {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  name: string;

  @Column({ nullable: true })
  iconUrl: string;

  @OneToMany(() => ActiveSkill, (activeSkill) => activeSkill.element)
  activeSkills: ActiveSkill[];
}
