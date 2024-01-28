import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PalsModule } from './pals/pals.module';
import { TypeOrmModule} from '@nestjs/typeorm';
import { Pal } from './pals/entities/pal.entity';
@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'aws-0-ap-southeast-1.pooler.supabase.com',
      port: 6543,
      username: 'postgres.otzrgzxqplrstaikxerb',
      password: 'Renolation29',
      database: 'postgres',
      entities: [Pal],
      synchronize: true,
    }),
    PalsModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
