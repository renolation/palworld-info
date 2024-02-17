import { Module } from '@nestjs/common';
import { PassiveSkillsService } from './passive-skills.service';
import { PassiveSkillsController } from './passive-skills.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Pal } from '../pals/entities/pal.entity';
import { Element } from '../pals/entities/element.entity';
import { ActiveSkill } from '../pals/entities/active_skill.entity';
import { LevelWorkSuitability, WorkSuitability } from '../pals/entities/work_suitability.entity';
import { PassiveDesc, PassiveSkill, PSkillPal } from './entities/passive-skill.entity';

@Module({
    imports: [
    TypeOrmModule.forFeature([PassiveSkill, PassiveDesc, PSkillPal ]),
    ],
  controllers: [PassiveSkillsController],
  providers: [PassiveSkillsService],
  exports: [PassiveSkillsService]
})
export class PassiveSkillsModule {}
