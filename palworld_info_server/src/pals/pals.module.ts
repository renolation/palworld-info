import { Module } from '@nestjs/common';
import { PalsService } from './pals.service';
import { PalsController } from './pals.controller';
import { WorkSuitability } from "./entities/work_suitability.entity";
import { Pal } from "./entities/pal.entity";
import { TypeOrmModule } from "@nestjs/typeorm";
import { PartnerSkill } from "./entities/partner_skill.entity";
import { Element } from "./entities/element.entity";
import { ElementService } from "./services/element.service";

@Module({
  imports: [
    TypeOrmModule.forFeature([Pal, Element, PartnerSkill, WorkSuitability]),
    ],
  controllers: [PalsController],
  providers: [PalsService, ElementService],
  exports: [PalsService, ElementService]
})
export class PalsModule {}
