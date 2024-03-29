import { Entity, PrimaryGeneratedColumn, Column, JoinTable, ManyToMany, ManyToOne, OneToMany } from "typeorm";
import { Element } from "./element.entity";
import { LevelWorkSuitability, WorkSuitability } from "./work_suitability.entity";
import { PSkillPal } from '../../skills/entities/passive_skill.entity';
import { PartnerPal } from "./partner.entity";
import { ActiveSkill } from "../../skills/entities/active_skill.entity";
import { ActiveSkillPal } from "../../skills/entities/active_skill_pal.entity";
import { PalItemEntity } from './pal_item.entity';

export enum PalSize {
  S = "S",
  M = "M",
  L = "L",
}

@Entity()
export class Pal {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({unique: true})
  name: string;

   @OneToMany(() => PalItemEntity, palItem => palItem.pal)
    palItems: PalItemEntity[];

  @Column({nullable: true})
  title: string;

  @Column({nullable: true})
  slug: string;

  @ManyToMany(() => Element)
  @JoinTable()
  elements: Element[]
  //
  @ManyToMany(() => LevelWorkSuitability)
  @JoinTable()
  levelWorkSuitability: LevelWorkSuitability[]

  @ManyToMany(() => PSkillPal, (pSkill) => pSkill.pals)
  @JoinTable()
  pSkillPals: PSkillPal[];

  @ManyToOne(() => PartnerPal, (partner) => partner.pal)
  partnerPal: PartnerPal;

  @ManyToMany(() => ActiveSkillPal, (activeSkillsPal) => activeSkillsPal.pals)
  @JoinTable()
  activeSkillsPal: ActiveSkillPal[];

  // @Column({
  //   type: "enum",
  //   enum: PalSize,
  //   default: PalSize.M
  // })
  // size: PalSize;

  @Column({nullable: true})
  iconUrl: string;

  @Column({nullable: true})
  summary: string;

  @Column({nullable: true})
  size: string;

  @Column({nullable: true})
  rarity: number;

  @Column({nullable: true})
  hp: number;

  @Column({nullable: true})
  meleeAttack: number;

  @Column({nullable: true})
  magicAttack: number;

  @Column({nullable: true})
  defense: number;

  @Column({nullable: true})
  support: number;

  @Column({nullable: true})
  craftSpeed: number;

  @Column({nullable: true})
  captureRate: number;

  @Column({nullable: true})
  price: number;

  @Column({nullable: true})
  slowWalkSpeed: number;

  @Column({nullable: true})
  runSpeed: number;

  @Column({nullable: true})
  rideSprintSpeed: number;

  @Column({nullable: true})
  foodAmount: number;

  @Column({nullable: true})
  maleProbability: number;
}
