import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { StructuresService } from './structures.service';
import { CreateStructureDto } from './dto/create-structure.dto';
import { UpdateStructureDto } from './dto/update-structure.dto';
import { UpdateItemDto } from "../items/dto/update-item.dto";
import { delay } from "../items/items.controller";

@Controller('structures')
export class StructuresController {
  constructor(private readonly structuresService: StructuresService) {
  }

  @Post()
  create(@Body() createStructureDto: CreateStructureDto) {
    return this.structuresService.create(createStructureDto);
  }

  @Get('/crawl/get')
  async crawlItems() {
    let structureArray = await this.structuresService.crawlStructures();
    for (const structure of structureArray) {
      await this.structuresService.create(structure);
    }
  }

    @Get("/crawl/detail")
  async crawlItemDetail() {
    const items = await this.structuresService.findAll();
    for (let item of items) {
      const data = await this.structuresService.crawlStructureDetail(item.slug);
      await delay(50);
      console.log(data);
      let updatedStructureDto = new UpdateStructureDto();
      updatedStructureDto.summary = data.summary;
      updatedStructureDto.buildWork = data.buildWork;
      updatedStructureDto.consumeEnergySpeed = data.consumeEnergySpeed;
      updatedStructureDto.energyType = data.energyType;

      await this.structuresService.updateBySlug(item.slug, updatedStructureDto);
    }
    return "aa";
  }

  @Get()
  async findAll() {
    return await this.structuresService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.structuresService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateStructureDto: UpdateStructureDto) {
    return this.structuresService.update(+id, updateStructureDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.structuresService.remove(+id);
  }
}
