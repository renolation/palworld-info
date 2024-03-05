import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ItemsService } from './items.service';
import { CreateItemDto } from './dto/create-item.dto';
import { UpdateItemDto } from './dto/update-item.dto';

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
    for(let item of items){
      let data = await this.itemsService.crawlItemDetail(item.name);
      console.log(data);
    }
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
