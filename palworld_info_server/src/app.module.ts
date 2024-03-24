import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PalsModule } from './pals/pals.module';
import { TypeOrmModule} from '@nestjs/typeorm';
import { Pal } from './pals/entities/pal.entity';
import { Element } from "./pals/entities/element.entity";
import { ActiveSkill } from "./skills/entities/active_skill.entity";
import { LevelWorkSuitability, WorkSuitability } from "./pals/entities/work_suitability.entity";
import { PassiveDesc, PassiveSkill, PSkillPal } from './skills/entities/passive_skill.entity';
import { SkillsModule } from './skills/skills.module';
import { Partner, PartnerPal } from "./pals/entities/partner.entity";
import { ActiveSkillPal } from "./skills/entities/active_skill_pal.entity";
import { ConfigModule } from '@nestjs/config';
import { ItemsModule } from './items/items.module';
import { ItemEntity } from './items/entities/item.entity';
import { StructuresModule } from './structures/structures.module';
import { StructureEntity } from './structures/entities/structure.entity';
import { BreedingModule } from './breeding/breeding.module';
import { BreedingEntity } from './breeding/entities/breeding.entity';
import { PalItemEntity } from './pals/entities/pal_item.entity';
@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'aws-0-ap-southeast-1.pooler.supabase.com',
      port: 6543,
      username: 'postgres.otzrgzxqplrstaikxerb',
      password: 'Renolation29',
      database: 'postgres',
      entities: [Pal ,Element,ActiveSkillPal, ActiveSkill, WorkSuitability, LevelWorkSuitability, PassiveSkill, PassiveDesc,PSkillPal, Partner, PartnerPal, ItemEntity, StructureEntity, BreedingEntity, PalItemEntity],
      synchronize: true,
    }),
    PalsModule,
    SkillsModule,
    ConfigModule.forRoot(),
    ItemsModule,
    StructuresModule,
    BreedingModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
