import { Module } from "@nestjs/common";
import { PalsService } from "./pals.service";
import { PalsController } from "./pals.controller";
import { LevelWorkSuitability, WorkSuitability } from "./entities/work_suitability.entity";
import { Pal } from "./entities/pal.entity";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Element } from "./entities/element.entity";
import { ElementService } from "./services/element.service";
import { PassiveDesc, PassiveSkill, PSkillPal } from "../skills/entities/passive_skill.entity";
import { SkillsModule } from "../skills/skills.module";
import { Partner, PartnerPal } from "./entities/partner.entity";
import { ActiveSkill } from "../skills/entities/active_skill.entity";
import { ActiveSkillPal } from "../skills/entities/active_skill_pal.entity";
import { PalItemEntity } from './entities/pal_item.entity';
import { ItemEntity } from '../items/entities/item.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([Pal, Element, WorkSuitability, LevelWorkSuitability, PassiveSkill, PassiveDesc, PSkillPal, Partner, PartnerPal, ActiveSkill, ActiveSkillPal, PalItemEntity, ItemEntity]),
    SkillsModule
  ],
  controllers: [PalsController],
  providers: [PalsService, ElementService],
  exports: [PalsService, ElementService]
})
export class PalsModule {
}
