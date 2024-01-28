import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PalsService } from './pals.service';
import { CreatePalDto } from './dto/create-pal.dto';
import { UpdatePalDto } from './dto/update-pal.dto';

@Controller('pals')
export class PalsController {
  constructor(private readonly palsService: PalsService) {}

  @Post()
  create(@Body() createPalDto: CreatePalDto) {
    return this.palsService.create(createPalDto);
  }

  @Get()
  findAll() {
    return this.palsService.findAll();
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
