import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { StructuresService } from './structures.service';
import { CreateStructureDto } from './dto/create-structure.dto';
import { UpdateStructureDto } from './dto/update-structure.dto';

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

  @Get()
  findAll() {
    return this.structuresService.findAll();
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
