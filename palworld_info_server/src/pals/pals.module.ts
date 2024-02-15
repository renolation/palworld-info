import { Module } from '@nestjs/common';
import { PalsService } from './pals.service';
import { PalsController } from './pals.controller';
import { LevelWorkSuitability, WorkSuitability } from "./entities/work_suitability.entity";
import { Pal } from "./entities/pal.entity";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Skill } from "./entities/skill.entity";
import { Element } from "./entities/element.entity";
import { ElementService } from "./services/element.service";
import { PassiveDesc, PassiveSkill, PSkillPal } from '../passive-skills/entities/passive-skill.entity';
import { PassiveSkillsModule } from '../passive-skills/passive-skills.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([Pal, Element, Skill, WorkSuitability, LevelWorkSuitability, PassiveSkill, PassiveDesc, PSkillPal ]),
    PassiveSkillsModule
    ],
  controllers: [PalsController],
  providers: [PalsService, ElementService],
  exports: [PalsService, ElementService]
})
export class PalsModule {}
