import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class Element {
  @PrimaryGeneratedColumn()
  id: number;
 
  @Column()
    name: string

  @Column({nullable: true})
    iconUrl: string
 
}
