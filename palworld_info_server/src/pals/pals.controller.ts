import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PalsService } from './pals.service';
import { CreatePalDto } from './dto/create-pal.dto';
import { UpdatePalDto } from './dto/update-pal.dto';
import { ElementService } from './services/element.service';
import { PSkillPal } from '../passive-skills/entities/passive-skill.entity';

@Controller('pals')
export class PalsController {
  constructor(
    private readonly palsService: PalsService,
    private readonly elementService: ElementService,
  ) {
  }

  @Post()
  create(@Body() createPalDto: CreatePalDto) {
    return this.palsService.create(createPalDto);
  }

  @Get('/:slug')
  findOneBySlug(@Param('slug') slug: string) {
    return this.palsService.findOneBySlug(slug);
  }

  @Get('id/:id')
  findOne(@Param('id') id: string) {
    return this.palsService.findOne(+id);
  }

  @Get()
  findAll() {
    return this.palsService.findAll();
  }

  @Get('element')
  findAllElement() {
    return this.palsService.findAllElement();
  }

  @Get('work')
  findAllWork() {
    return this.palsService.findAllWork();
  }

  @Get('crawl-elements')
  async crawlElements() {
    const arrayElements = await this.elementService.crawlElement();
    for (const element of arrayElements) {
      await this.palsService.createElement(element.name, element.iconUrl);
    }
  }

  @Get('crawl-passive')
  async crawlPassive() {
    // const arrayElements = await this.elementService.crawlPassiveSkill();
    // console.log('dat');
    // return arrayElements;
  }

  @Get('crawl-work')
  async crawlWork() {
    const arrayWork = await this.elementService.crawlWork();
    for (const work of arrayWork) {
      await this.palsService.createWork(work.name, work.iconUrl);
    }
  }

  @Get('crawl-pals')
  async crawlPals() {
    const arrayPal = await this.elementService.crawlPals();
    for (const pal of arrayPal) {
      await this.palsService.createPal(pal);
    }
  }

  @Get('crawl-pal/:id')
  async crawlPal(@Param('id') id: string) {
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

    return await this.palsService.updatePalMerge(id, updatePalDto);
  }

  @Get('crawl-all-pals-data')
  async crawlAllPalsData() {
    const pals = await this.palsService.findAll();
    const promises = pals.map(async (pal) => {
      const palData = await this.palsService.crawlPalData(pal.slug);
      const updatePalDto = new UpdatePalDto();
      updatePalDto.name = palData.name;
      updatePalDto.title = palData.title;
      updatePalDto.size = palData.size;
      updatePalDto.rarity = parseInt(palData.rarity);
      updatePalDto.hp = parseInt(palData.hp);
      updatePalDto.meleeAttack = parseInt(palData.meleeAttack);
      updatePalDto.magicAttack = parseInt(palData.magicAttack);
      updatePalDto.defense = parseInt(palData.defense);
      updatePalDto.support = parseInt(palData.support);
      updatePalDto.craftSpeed = parseInt(palData.craftSpeed);
      updatePalDto.captureRate = parseInt(palData.captureRate);
      updatePalDto.price = parseInt(palData.price);
      updatePalDto.slowWalkSpeed = parseInt(palData.slowWalkSpeed);
      updatePalDto.runSpeed = parseInt(palData.runSpeed);
      updatePalDto.rideSprintSpeed = parseInt(palData.rideSprintSpeed);
      updatePalDto.foodAmount = parseInt(palData.foodAmount);
      updatePalDto.maleProbability = parseInt(palData.maleProbability);
      return this.palsService.updatePalMerge(pal.slug, updatePalDto);
    });

    await Promise.all(promises);
  }

  @Get('crawl-header/:id')
  async crawlHeader(@Param('id') id: string) {
    const pal = await this.palsService.crawlPalHeader(id);
    let updatePalDto = new UpdatePalDto();
    updatePalDto.element = pal.element;
    updatePalDto.levelWorkSuitability = await this.palsService.findByListID(pal.levelWork);
    return await this.palsService.updatePal(id, updatePalDto);
  }

  @Get('crawl-all-header/')
  async crawlAllHeader() {
    const pals = await this.palsService.findAll();

    const promises = pals.map(async (pal) => {
      const palData = await this.palsService.crawlPalHeader(pal.slug);
      let updatePalDto = new UpdatePalDto();
      updatePalDto.element = palData.element;
      updatePalDto.levelWorkSuitability = await this.palsService.findByListID(palData.levelWork);
      return await this.palsService.updatePal(pal.slug, updatePalDto);
    });
    await Promise.all(promises);
  }

  @Get('crawl-summary/:id')
  async crawlSummary(@Param('id') id: string) {
    const summary = await this.elementService.crawlSummary(id);
    let updatePalDto = new UpdatePalDto();
    updatePalDto.summary = summary;
    return await this.palsService.updatePalMerge(id, updatePalDto);
  }

  @Get('crawl-all-summary')
  async crawlAllSummary() {
    const pals = await this.palsService.findAll();
    const promises = pals.map(async (pal) => {
      const summary = await this.elementService.crawlSummary(pal.slug);
      let updatePalDto = new UpdatePalDto();
      updatePalDto.summary = summary;
      await this.palsService.updatePalMerge(pal.slug, updatePalDto);
    });
    await Promise.all(promises);
  }

  @Get('crawl-all-icon')
  async crawlAllIcon() {
    const pals = await this.palsService.findAll();
    const promises = pals.map(async (pal) => {
      const iconUrl = await this.elementService.crawlPalIcon(pal.slug);
      let updatePalDto = new UpdatePalDto();
      updatePalDto.iconUrl = iconUrl;
      await this.palsService.updatePalMerge(pal.slug, updatePalDto);
    });
    await Promise.all(promises);
  }

  @Get('crawl-pSkill/:id')
  async crawlPassiveSkill(@Param('id') id: string) {
    const passiveSkill = await this.elementService.crawlPassiveSkillPal(id);

    if (passiveSkill instanceof PSkillPal) {
      let updatePalDto = new UpdatePalDto();
      updatePalDto.passiveSkill = passiveSkill;
      return await this.palsService.updatePal(id, updatePalDto);
    }
    return 'fail';
  }

  @Get('crawl-pSkills')
  async crawlAllPassiveSkill() {
    const pals = await this.palsService.findAll();

    const promises = pals.map(async (pal) => {
      const passiveSkill = await this.elementService.crawlPassiveSkillPal(pal.slug);
      if (passiveSkill instanceof PSkillPal) {
        let updatePalDto = new UpdatePalDto();
        updatePalDto.passiveSkill = passiveSkill;
        return await this.palsService.updatePal(pal.slug, updatePalDto);
      }
    });
    await Promise.all(promises);

    return 'fail';
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