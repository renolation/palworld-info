import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PalsModule } from './pals/pals.module';
import { TypeOrmModule} from '@nestjs/typeorm';
import { Pal } from './pals/entities/pal.entity';
import { Element } from "./pals/entities/element.entity";
import { Skill } from "./pals/entities/skill.entity";
import { LevelWorkSuitability, WorkSuitability } from "./pals/entities/work_suitability.entity";
import { PassiveDesc, PassiveSkill, PSkillPal } from './passive-skills/entities/passive-skill.entity';
import { PassiveSkillsModule } from './passive-skills/passive-skills.module';
@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'aws-0-ap-southeast-1.pooler.supabase.com',
      port: 6543,
      username: 'postgres.otzrgzxqplrstaikxerb',
      password: 'Renolation29',
      database: 'postgres',
      entities: [Pal ,Element, Skill, WorkSuitability, LevelWorkSuitability, PassiveSkill, PassiveDesc,PSkillPal],
      synchronize: true,
    }),
    PalsModule,
    PassiveSkillsModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
