import { Module } from '@nestjs/common';
import { BreedingService } from './breeding.service';
import { BreedingController } from './breeding.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ItemEntity } from '../items/entities/item.entity';
import { BreedingEntity } from './entities/breeding.entity';

@Module({

  imports: [
    TypeOrmModule.forFeature([BreedingEntity])
  ],
  controllers: [BreedingController],
  providers: [BreedingService],
  exports: [BreedingService]
})
export class BreedingModule {}
