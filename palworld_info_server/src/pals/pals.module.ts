import { Module } from '@nestjs/common';
import { PalsService } from './pals.service';
import { PalsController } from './pals.controller';

@Module({
  controllers: [PalsController],
  providers: [PalsService],
})
export class PalsModule {}
