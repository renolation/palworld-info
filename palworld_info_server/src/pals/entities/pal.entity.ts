import { Entity, PrimaryGeneratedColumn, Column, JoinTable, ManyToMany } from "typeorm";
import { Element } from "./element.entity";
import { LevelWorkSuitability, WorkSuitability } from "./work_suitability.entity";

export enum PalSize {
  S = "S",
  M = "M",
  L = "L",
}

@Entity()
export class Pal {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  title: string;

  @ManyToMany(() => Element)
  @JoinTable()
  elements: Element[]

  @ManyToMany(() => LevelWorkSuitability)
  @JoinTable()
  levelWorkSuitability: LevelWorkSuitability[]

  @Column({
    type: "enum",
    enum: PalSize,
    default: PalSize.M
  })
  size: PalSize;

  @Column()
  rarity: number;

  @Column()
  hp: number;

  @Column()
  meleeAttack: number;

  @Column()
  magicAttack: number;

  @Column()
  defense: number;

  @Column()
  support: number;

  @Column()
  craftSpeed: number;

  @Column()
  captureRate: number;

  @Column()
  price: number;

  @Column()
  slowWalkSpeed: number;

  @Column()
  runSpeed: number;

  @Column()
  rideSprintSpeed: number;

  @Column()
  foodAmount: number;

  @Column()
  maleProbability: number;
}
