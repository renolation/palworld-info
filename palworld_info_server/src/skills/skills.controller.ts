import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SkillsService } from './skills.service';
import { CreatePassiveSkillDto } from './dto/create-passive-skill.dto';
import { UpdatePassiveSkillDto } from './dto/update-passive-skill.dto';

@Controller('skills')
export class SkillsController {
  constructor(private readonly skillsService: SkillsService) {
  }

  @Post()
  create(@Body() createPassiveSkillDto: CreatePassiveSkillDto) {
    return this.skillsService.create(createPassiveSkillDto);
  }

   @Get('get/passive')
  async getAllPassive() {
    return await this.skillsService.getAllPassiveSkills();
  }

      @Get('get/partner')
  async getAllPartner() {
    return await this.skillsService.getAllPartnerSkills();
  }

    @Get('get/active')
  async getAllActive() {
    return await this.skillsService.getAllActiveSkills();
  }

  @Get('crawl-passive')
  async crawlPassive() {
    const arrayElements = await this.skillsService.crawlPassiveSkill();
    console.log('dat');
    return arrayElements;
  }

  @Get('findAllPals')
  findAllPals() {
    return this.skillsService.findAllPals();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.skillsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updatePassiveSkillDto: UpdatePassiveSkillDto) {
    return this.skillsService.update(+id, updatePassiveSkillDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.skillsService.remove(+id);
  }


}
