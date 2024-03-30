import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn, Unique } from 'typeorm';
import { Pal } from '../../pals/entities/pal.entity';
import { ItemEntity } from './item.entity';

@Entity()
@Unique(["itemCount", "recipe", "material"])
export class ItemRecipeEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    itemCount: number;


    @ManyToOne(() => ItemEntity, item => item.material)
    @JoinColumn() // This adds a column for the foreign key
    recipe: ItemEntity;

    @ManyToOne(() => ItemEntity, item => item.recipe)
    @JoinColumn() // This adds a column for the foreign key
    material: ItemEntity;

}