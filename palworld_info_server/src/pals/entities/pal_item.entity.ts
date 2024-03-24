import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn, Unique } from 'typeorm';
import { Pal } from './pal.entity';
import { ItemEntity } from '../../items/entities/item.entity';

@Entity()
@Unique(["item", "isBoss", "pal"])

export class PalItemEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    itemCount: string;

    @Column()
    chance: number;

    @ManyToOne(() => Pal, pal => pal.palItems)
    @JoinColumn() // This adds a column for the foreign key
    pal: Pal;

    @ManyToOne(() => ItemEntity, item => item.palItems)
    @JoinColumn() // This adds a column for the foreign key
    item: ItemEntity;

    @Column()
    isBoss: boolean;
}