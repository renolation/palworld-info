import { Entity, PrimaryGeneratedColumn, Column, JoinTable, ManyToMany } from "typeorm";
import { Element } from "./element.entity";
import { WorkSuitability } from "./work_suitability.entity";

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

  @ManyToMany(() => Element)
  @JoinTable()
  elements: Element[]

  @ManyToMany(() => WorkSuitability)
  @JoinTable()
  work_suitabilities: WorkSuitability[]

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
  melee_attack: number;

  @Column()
  magic_attack: number;

  @Column()
  defense: number;

  @Column()
  support: number;

  @Column()
  craft_speed: number;

  @Column()
  capture_rate: number;

  @Column()
  price: number;

  @Column()
  slow_walk_speed: number;

  @Column()
  run_speed: number;

  @Column()
  ride_sprint_speed: number;

  @Column()
  food_amount: number;

  @Column()
  male_probability: number;
}
