import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PalsService } from './pals.service';
import { CreatePalDto } from './dto/create-pal.dto';
import { UpdatePalDto } from './dto/update-pal.dto';
import { ElementService } from "./services/element.service";

@Controller('pals')
export class PalsController {
  constructor(
    private readonly palsService: PalsService,
    private readonly elementService: ElementService
  ) {}

  @Post()
  create(@Body() createPalDto: CreatePalDto) {
    return this.palsService.create(createPalDto);
  }

  @Get()
  findAll() {
    return this.elementService.crawlWork();
  }

  @Get('crawl-elements')
  async crawlElements(){
    const arrayElements = await this.elementService.crawlElement();
    for (const element of arrayElements) {
      await this.palsService.createElement(element.name, element.iconUrl);
    }
  }

  @Get('crawl-work')
  async crawlWork(){
    const arrayWork = await this.elementService.crawlWork();
    for (const work of arrayWork) {
      await this.palsService.createWork(work.name, work.iconUrl);
    }
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.palsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updatePalDto: UpdatePalDto) {
    return this.palsService.update(+id, updatePalDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.palsService.remove(+id);
  }
}
