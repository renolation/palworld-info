import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from "typeorm";
import { Element } from "../../pals/entities/element.entity";

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
}
