import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Pal } from "./pal.entity";

@Entity()
export class Partner {

  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  name: string;

  @Column({ nullable: true })
  iconUrl: string;

  @OneToMany(() => PartnerPal, partnerPal => partnerPal.partner)
  partnerPals: PartnerPal[];
}


@Entity()
export class PartnerPal {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  name: string;

  @Column()
  description: string

  @ManyToOne(() => Partner, partner => partner.partnerPals)
  @JoinColumn()
  partner: Partner;

  @OneToMany(() => Pal, (pal) => pal.partnerPal)
  pal: Pal[];
}