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
    return this.elementService.crawlPals();
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

  @Get('crawl-pals')
  async crawlPals(){
    const arrayPal = await this.elementService.crawlPals();
    for (const pal of arrayPal) {
      await this.palsService.createPal(pal);
    }
  }

  @Get('crawl-pal/:id')
  async crawlPal(@Param('id') id: string){
    const pal = await this.palsService.crawlPalData(id);
    console.log(pal);
    let updatePalDto = new UpdatePalDto();
    updatePalDto.name = pal.name;
    updatePalDto.title = pal.title;
    updatePalDto.size = pal.size;
    updatePalDto.rarity = parseInt(pal.rarity);
    updatePalDto.hp = parseInt(pal.hp);
    updatePalDto.meleeAttack = parseInt(pal.meleeAttack);
    updatePalDto.magicAttack = parseInt(pal.magicAttack);
    updatePalDto.defense = parseInt(pal.defense);
    updatePalDto.support = parseInt(pal.support);
    updatePalDto.craftSpeed = parseInt(pal.craftSpeed);
    updatePalDto.captureRate = parseInt(pal.captureRate);
    updatePalDto.price = parseInt(pal.price);
    updatePalDto.slowWalkSpeed = parseInt(pal.slowWalkSpeed);
    updatePalDto.runSpeed = parseInt(pal.runSpeed);
    updatePalDto.rideSprintSpeed = parseInt(pal.rideSprintSpeed);
    updatePalDto.foodAmount = parseInt(pal.foodAmount);
    updatePalDto.maleProbability = parseInt(pal.maleProbability);

    return await this.palsService.updatePal(id, updatePalDto);
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