import { Injectable } from '@nestjs/common';
import { CreateItemDto } from './dto/create-item.dto';
import { UpdateItemDto } from './dto/update-item.dto';
import puppeteer from 'puppeteer-extra';
import { ItemEntity, ItemType } from './entities/item.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import axios from 'axios';
import * as cheerio from 'cheerio';

const StealthPlugin = require('puppeteer-extra-plugin-stealth');
puppeteer.use(StealthPlugin());

function delay(time: number) {
  return new Promise(function(resolve) {
    setTimeout(resolve, time);
  });
}


@Injectable()
export class ItemsService {

  constructor(
    @InjectRepository(ItemEntity) private repo: Repository<ItemEntity>,
  ) {
  }

  async create(createItemDto: CreateItemDto) {
    const existingItem = await this.repo.findOne({
      where: { name: createItemDto.name },
    });

    if (existingItem) {
      return;
    }

    const itemEntity = this.repo.create(
      {
        name: createItemDto.name,
        iconUrl: createItemDto.iconUrl,
        itemType: ItemType[createItemDto.itemType],
      },
    );
    try {
      await this.repo.save(itemEntity);
    } catch (error) {
      throw error;
    }
  }

  async findAll() {
    return await this.repo.find({
      order: {
        name: 'ASC',
      },
      relations: {
          palItems: {
            pal: true
          }
        }
    });
  }

  async findOne(id: number) {
    return await this.repo.find(
      {
        where: {
          id: id
        },
        relations: {
          palItems: {
            pal: true
          }
        }
      },

    )
  }

  async findOneBySlug(slug: string) {
    return await this.repo.find(
      {
        where: {
          slug: slug,
        },
        relations: {
          palItems: {
            pal: true
          }
        }
      },
    );
  }

  async updateBySlug(name: string, updateItemDto: UpdateItemDto) {
    const itemToUpdate = await this.repo.findOne({
      where: { name },

    });
    if (!itemToUpdate) {
      return;
      // throw new Error(`Item with ID: ${name} not found.`);
    }
    console.log('good');
    console.log(itemToUpdate.slug);
    const updatedItem = this.repo.merge(itemToUpdate, updateItemDto);
    try {
      await this.repo.save(updatedItem);
    } catch (error) {
      throw new Error(`Item could not be saved: ${error}`);
    }
    return updatedItem;
  }

  update(id: number, updateItemDto: UpdateItemDto) {
    return `This action updates a #${id} item`;
  }

  remove(id: number) {
    return `This action removes a #${id} item`;
  }

  async crawlItem(): Promise<ItemEntity[]> {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setUserAgent('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3');
    await page.goto('https://palworldtrainer.com/items');
    const filterButtons = await page.$$('.sidebar .content .filters .button.filter.text');
    let itemsArray = [];

    // console.log(filterButtons.length);
    for (let i = 0; i < filterButtons.length; i++) {

      const buttonText = await page.evaluate(el => el.textContent, filterButtons[i]);
      console.log(buttonText);
      if (buttonText === 'Special Weapon') {
        console.log(buttonText);
      }
      await filterButtons[i].click();
      await delay(500); // waits for 3000ms = 3s
      console.log('aaa');
      const items = await page.$$('div.page-body section.content a.card');
      // for(let i = 0; i<2; i++){
      for (const item of items) {
        let name = await page.evaluate(el => el.querySelector('.item-name')?.textContent, item);
        let slug = await page.evaluate(el => el.getAttribute('href'), item);
        console.log(slug);
        let itemEntity = new UpdateItemDto();

        itemEntity.name = name;
        itemEntity.slug = slug;
        await this.updateBySlug(name, itemEntity);
        itemsArray.push(itemEntity);
      }
      console.log(items.length);

      await filterButtons[i].click();
      // await page.waitForNavigation({ waitUntil: 'networkidle0' });
      await delay(300);
    }
    await browser.close();
    return itemsArray;
  }


  async crawlItemDetail(slug: string) {

    console.log(`https://palworldtrainer.com${slug}`);
    const response = await axios.get(`https://palworldtrainer.com${slug}`);

    const $ = cheerio.load(response.data);
    const content = $('.item');

    const summary = $('.content .summary').eq(0).find('p').text();

    const rankStr = content.find('.row:has(.label:contains(\'Rank\')) .right .value').text();
    const rank = rankStr ? Number(rankStr) : null;

    const rarityStr = content.find('.row:has(.label:contains(\'Rarity\')) .right .value').text();
    const rarity = rarityStr ? Number(rarityStr) : null;

    const priceStr = content.find('.row:has(.label:contains(\'Price\')) .right .value').text();
    const price = priceStr ? Number(priceStr) : null;

    const weightStr = content.find('.row:has(.label:contains(\'Weight\')) .right .value').text();
    const weight = weightStr ? Number(weightStr) : null;

    const maxStackCountStr = content.find('.row:has(.label:contains(\'Max Stack Count\')) .right .value').text();
    const maxStackCount = maxStackCountStr ? Number(maxStackCountStr) : null;

    const physAttackStr = content.find('.row:has(.label:contains(\'Phys Attack\')) .right .value').text();
    const physAttack = physAttackStr ? Number(physAttackStr) : null;

    const durabilityStr = content.find('.row:has(.label:contains(\'Durability\')) .right .value').text();
    const durability = durabilityStr ? Number(durabilityStr) : null;

    const restoreConcentrationStr = content.find('.row:has(.label:contains(\'Restore Concentration\')) .right .value').text();
    const restoreConcentration = restoreConcentrationStr ? Number(restoreConcentrationStr) : null;

    const restoreSatietyStr = content.find('.row:has(.label:contains(\'Restore Satiety\')) .right .value').text();
    const restoreSatiety = restoreSatietyStr ? Number(restoreSatietyStr) : null;


    const passiveSkillStr = content.find('.row:has(.label:contains("Passive Skill")) .right .value').text();
    const passiveSkill = passiveSkillStr ? passiveSkillStr : null;

    return {
      summary,
      rarity,
      rank,
      price,
      weight,
      maxStackCount,
      physAttack,
      durability,
      restoreConcentration,
      restoreSatiety,
      passiveSkill,
    };
  }
}
