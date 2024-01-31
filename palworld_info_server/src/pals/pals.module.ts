import { Module } from '@nestjs/common';
import { PalsService } from './pals.service';
import { PalsController } from './pals.controller';
import { LevelWorkSuitability, WorkSuitability } from "./entities/work_suitability.entity";
import { Pal } from "./entities/pal.entity";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Skill } from "./entities/skill.entity";
import { Element } from "./entities/element.entity";
import { ElementService } from "./services/element.service";

@Module({
  imports: [
    TypeOrmModule.forFeature([Pal, Element, Skill, WorkSuitability, LevelWorkSuitability ]),
    ],
  controllers: [PalsController],
  providers: [PalsService, ElementService],
  exports: [PalsService, ElementService]
})
export class PalsModule {}
