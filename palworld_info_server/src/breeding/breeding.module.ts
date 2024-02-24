import { Module } from '@nestjs/common';
import { BreedingService } from './breeding.service';
import { BreedingController } from './breeding.controller';

@Module({
  controllers: [BreedingController],
  providers: [BreedingService],
})
export class BreedingModule {}
