import { Injectable } from '@nestjs/common';
import { CreateItemDto } from './dto/create-item.dto';
import { UpdateItemDto } from './dto/update-item.dto';
import puppeteer from 'puppeteer-extra';
const StealthPlugin = require('puppeteer-extra-plugin-stealth');
puppeteer.use(StealthPlugin());

class Item {
  private name: any;
  private type: any;

  constructor(name, type) {
    this.name = name;
    this.type = type;
  }
}

@Injectable()
export class ItemsService {
  create(createItemDto: CreateItemDto) {
    return 'This action adds a new item';
  }

  findAll() {
    return `This action returns all items`;
  }

  findOne(id: number) {
    return `This action returns a #${id} item`;
  }

  update(id: number, updateItemDto: UpdateItemDto) {
    return `This action updates a #${id} item`;
  }

  remove(id: number) {
    return `This action removes a #${id} item`;
  }

  async crawlItem() {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
      await page.setUserAgent('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3');
    await page.goto('https://palworldtrainer.com/items');
    const filterButtons = await page.$$('.sidebar .content .filters .button.filter.text');    let items = [];
        console.log('aaa');


    // console.log(filterButtons.length);
    for (let i = 0; i < filterButtons.length; i++) {


      const buttonText = await page.evaluate(el => el.textContent, filterButtons[i]);
        console.log(buttonText);

      // await filterButtons[i].click();
      // await page.waitForNavigation({ waitUntil: 'networkidle0' });
      //
      // let itemsData = await page.evaluate(() => {
      //   const nodes = document.querySelectorAll('section.content a.card');
      //   return Array.from(nodes).map(node => ({
      //     name: node.querySelector('.item-name')?.textContent,
      //     image: node.querySelector('img')?.src,
      //   }));
      // });
      // for (let itemData of itemsData) {
      //   let item = new Item(itemData.name, itemData.image);
      //   items.push(item);
      // }
      //
      // await filterButtons[i].click();
      // await page.waitForNavigation({ waitUntil: 'networkidle0' });
    }
    await browser.close();
  }
}
