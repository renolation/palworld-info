import { Module } from '@nestjs/common';
import { ItemsService } from './items.service';
import { ItemsController } from './items.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ItemEntity } from './entities/item.entity';
import { ItemRecipeEntity } from './entities/item_recipe.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([ItemEntity, ItemRecipeEntity])
  ],
  controllers: [ItemsController],
  providers: [ItemsService],
  exports: [ItemsService]
})
export class ItemsModule {}
