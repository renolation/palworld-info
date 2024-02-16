import { Entity, PrimaryGeneratedColumn, Column, JoinTable, ManyToMany, ManyToOne } from 'typeorm';
import { Element } from "./element.entity";
import { LevelWorkSuitability, WorkSuitability } from "./work_suitability.entity";
import { PSkillPal } from '../../passive-skills/entities/passive-skill.entity';
import { PartnerPal } from "./partner.entity";

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

  @ManyToOne(() => PSkillPal, (pSkill) => pSkill.pal)
  pSkillPal: PSkillPal;

  @ManyToOne(() => PartnerPal, (partner) => partner.pal)
  partnerPal: PartnerPal;

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
