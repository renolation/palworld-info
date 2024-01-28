import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PalsModule } from './pals/pals.module';

@Module({
  imports: [PalsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
