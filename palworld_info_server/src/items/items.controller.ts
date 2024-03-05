import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ItemsService } from './items.service';
import { CreateItemDto } from './dto/create-item.dto';
import { UpdateItemDto } from './dto/update-item.dto';
import { UpdatePalDto } from "../pals/dto/update-pal.dto";
import { data } from "cheerio/lib/api/attributes";
function delay(time: number) {
  return new Promise(function(resolve) {
    setTimeout(resolve, time);
  });
}
@Controller('items')
export class ItemsController {
  constructor(private readonly itemsService: ItemsService) {}

  @Post()
  async create(@Body() createItemDto: CreateItemDto) {
    return await this.itemsService.create(createItemDto);
  }

  @Get()
  async findAll() {
    return await this.itemsService.findAll();
  }

    @Get('/crawl/get')
  async crawlItems() {
    let itemArray =  await this.itemsService.crawlItem();
    for(const item of itemArray){
      await this.itemsService.create(item);
    }
  }

      @Get('/crawl/detail')
  async crawlItemDetail() {
    const items =await this.itemsService.findAll();
    const promises = items.map(async (item) => {
      const data = await this.itemsService.crawlItemDetail(item.name);
      await delay(1000);
      let updatedItemDto = new UpdateItemDto();
      updatedItemDto.rank = data.rank;
      updatedItemDto.price = data.price;
      updatedItemDto.weight = data.weight;
      updatedItemDto.maxStackCount = data.maxStackCount;
      updatedItemDto.physAttack = data.physAttack;
      updatedItemDto.durability = data.durability;
      updatedItemDto.restoreConcentration = data.restoreConcentration;
      updatedItemDto.restoreSatiety = data.restoreSatiety;
      updatedItemDto.passiveSkill = data.passiveSkill;
      await this.itemsService.updateBySlug(item.name, updatedItemDto);
    });
     return await Promise.all(promises);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.itemsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateItemDto: UpdateItemDto) {
    return this.itemsService.update(+id, updateItemDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.itemsService.remove(+id);
  }
}
