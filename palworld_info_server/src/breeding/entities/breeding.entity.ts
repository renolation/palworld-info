import { Column, Entity, PrimaryGeneratedColumn, Unique } from 'typeorm';

@Entity()
@Unique(["parent1", "parent2", "child"])
export class Breeding {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  parent1: string;

  @Column()
  parent2: string;

  @Column()
  child: string;
}
