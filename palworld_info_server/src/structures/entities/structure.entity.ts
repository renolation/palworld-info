import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

export enum StructureType {
  "Product" = "Product",
  "Pal" = "Pal",
  "Food" = "Food",
  "Infrastructure" = "Infrastructure",
  "Light" = "Light",
  "Foundation" = "Foundation",
  "Defense" = "Defense",
  "Other" = "Other",
  "Furniture" = "Furniture",
  "Dismantle" = "Dismantle",

}

@Entity()
export class StructureEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  name: string;

  @Column({ nullable: true })
  slug: string;

  @Column({ nullable: true })
  iconUrl: string;

  @Column({ nullable: true })
  summary: string;

  @Column({
    type: "enum",
    enum: StructureType
  })
  structureType: StructureType;

  @Column({ nullable: true })
  buildWork: number;

  @Column({ nullable: true })
  energyType: string;

  @Column({ nullable: true })
  consumeEnergySpeed: number;


}
