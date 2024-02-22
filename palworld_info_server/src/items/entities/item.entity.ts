import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';


export enum ItemType {
  Weapon = 'Weapon',
  SpecialWeapon = 'Special Weapon',
  Armor = 'Armor',
  Accessory = 'Accessory',
  Material = 'Material',
  Consume = 'Consume',
  Ammo = 'Ammo',
  Food = 'Food',
  Essential = 'Essential',
  Glider = 'Glider',
  MonsterEquipWeapon = 'Monster Equip Weapon',
  Blueprint = 'Blueprint',
}

@Entity()
export class ItemEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  name: string;

  @Column({ nullable: true })
  iconUrl: string;

  @Column({
    type: 'enum',
    enum: ItemType,
  })
  itemType: ItemType;
}
