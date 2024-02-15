import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PassiveSkillsService } from './passive-skills.service';
import { CreatePassiveSkillDto } from './dto/create-passive-skill.dto';
import { UpdatePassiveSkillDto } from './dto/update-passive-skill.dto';

@Controller('passive-skills')
export class PassiveSkillsController {
  constructor(private readonly passiveSkillsService: PassiveSkillsService) {
  }

  @Post()
  create(@Body() createPassiveSkillDto: CreatePassiveSkillDto) {
    return this.passiveSkillsService.create(createPassiveSkillDto);
  }

  @Get()
  async findAll() {
    console.log('aaa');
    return await this.passiveSkillsService.findAll();
  }

  @Get('crawl-passive')
  async crawlPassive() {
    const arrayElements = await this.passiveSkillsService.crawlPassiveSkill();
    console.log('dat');
    return arrayElements;
  }

  @Get('findAllPals')
  findAllPals() {
    return this.passiveSkillsService.findAllPals();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.passiveSkillsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updatePassiveSkillDto: UpdatePassiveSkillDto) {
    return this.passiveSkillsService.update(+id, updatePassiveSkillDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.passiveSkillsService.remove(+id);
  }


}
