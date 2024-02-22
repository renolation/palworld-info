import { Module } from '@nestjs/common';
import { StructuresService } from './structures.service';
import { StructuresController } from './structures.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { StructureEntity } from './entities/structure.entity';

@Module({
    imports: [
    TypeOrmModule.forFeature([StructureEntity])
  ],
  controllers: [StructuresController],
  providers: [StructuresService],
  exports: [StructuresService]
})
export class StructuresModule {}
