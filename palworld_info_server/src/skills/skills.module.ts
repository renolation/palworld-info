import { Module } from '@nestjs/common';
import { SkillsService } from './skills.service';
import { SkillsController } from './skills.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Pal } from '../pals/entities/pal.entity';
import { Element } from '../pals/entities/element.entity';
import { ActiveSkill } from "./entities/active_skill.entity";
import { LevelWorkSuitability, WorkSuitability } from '../pals/entities/work_suitability.entity';
import { PassiveDesc, PassiveSkill, PSkillPal } from './entities/passive_skill.entity';
import { Partner, PartnerPal } from "../pals/entities/partner.entity";
import { ActiveSkillPal } from "./entities/active_skill_pal.entity";

@Module({
    imports: [
    TypeOrmModule.forFeature([Pal, PassiveSkill, PassiveDesc, PSkillPal, ActiveSkill, PartnerPal, ActiveSkillPal ]),
    ],
  controllers: [SkillsController],
  providers: [SkillsService],
  exports: [SkillsService]
})
export class SkillsModule {}
