import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";


export enum ItemType {
  "Weapon" = "Weapon",
  "Special Weapon" = "Special Weapon",
  "Armor" = "Armor",
  "Accessory" = "Accessory",
  "Material" = "Material",
  "Consume" = "Consume",
  "Ammo" = "Ammo",
  "Food" = "Food",
  "Essential" = "Essential",
  "Glider" = "Glider",
  "Monster Equip Weapon" = "Monster Equip Weapon",
  "Blueprint" = "Blueprint",
}

@Entity()
export class ItemEntity {
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
    enum: ItemType
  })
  itemType: ItemType;


  @Column({ nullable: true })
  rank: number;

  @Column({ nullable: true })
  rarity: number;



  @Column({ nullable: true })
  price: number;

  @Column({ nullable: true,   type: 'float', })
  weight: number;

  @Column({ nullable: true })
  maxStackCount: number;

  @Column({ nullable: true })
  physAttack: number;

  @Column({ nullable: true })
  durability: number;

  @Column({ nullable: true })
  restoreConcentration: number;

  @Column({ nullable: true })
  restoreSatiety: number;

  @Column({ nullable: true })
  passiveSkill: string;

}
