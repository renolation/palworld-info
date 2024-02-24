import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { BreedingService } from './breeding.service';
import { CreateBreedingDto } from './dto/create-breeding.dto';
import { UpdateBreedingDto } from './dto/update-breeding.dto';

@Controller('breeding')
export class BreedingController {
  constructor(private readonly breedingService: BreedingService) {}

  @Post()
  create(@Body() createBreedingDto: CreateBreedingDto) {
    return this.breedingService.create(createBreedingDto);
  }

  @Get()
  findAll() {
    return this.breedingService.findAll();
  }
    @Get('/crawl/get')
  async crawlItems() {
    let breedingArray =  await this.breedingService.crawlBreeding();
    console.log('aa');
    return 'breedingArray';
  }
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.breedingService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateBreedingDto: UpdateBreedingDto) {
    return this.breedingService.update(+id, updateBreedingDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.breedingService.remove(+id);
  }
}
