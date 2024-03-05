import { Injectable } from "@nestjs/common";
import { CreateItemDto } from "./dto/create-item.dto";
import { UpdateItemDto } from "./dto/update-item.dto";
import puppeteer from "puppeteer-extra";
import { ItemEntity, ItemType } from "./entities/item.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import slugify from "slugify";

const StealthPlugin = require("puppeteer-extra-plugin-stealth");
puppeteer.use(StealthPlugin());

function delay(time: number) {
  return new Promise(function(resolve) {
    setTimeout(resolve, time);
  });
}


@Injectable()
export class ItemsService {

  constructor(
    @InjectRepository(ItemEntity) private repo: Repository<ItemEntity>
  ) {
  }

  async create(createItemDto: CreateItemDto) {
    const existingItem = await this.repo.findOne({
      where: { name: createItemDto.name }
    });

    if (existingItem) {
      return;
    }

    const itemEntity = this.repo.create(
      {
        name: createItemDto.name,
        iconUrl: createItemDto.iconUrl,
        itemType: ItemType[createItemDto.itemType]
      }
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
        name: "ASC"
      }
    });
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

  async crawlItem(): Promise<ItemEntity[]> {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setUserAgent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
    await page.goto("https://palworldtrainer.com/items");
    const filterButtons = await page.$$(".sidebar .content .filters .button.filter.text");
    let itemsArray = [];

    // console.log(filterButtons.length);
    for (let i = 0; i < filterButtons.length; i++) {


      const buttonText = await page.evaluate(el => el.textContent, filterButtons[i]);
      console.log(buttonText);
      if (buttonText === "Special Weapon") {
        console.log(buttonText);
      }
      await filterButtons[i].click();
      await delay(500); // waits for 3000ms = 3s
      console.log("aaa");
      const items = await page.$$("div.page-body section.content a.card");
      // for(let i = 0; i<2; i++){
      for (const item of items) {
        let name = await page.evaluate(el => el.querySelector(".item-name")?.textContent, item);
        let imgSrc = await page.evaluate(el => el.querySelector("img")?.getAttribute("src"), item);
        let itemType = ItemType[buttonText];
        let itemEntity = new ItemEntity();
        itemEntity.name = name;
        itemEntity.iconUrl = imgSrc;
        itemEntity.itemType = itemType;
        itemsArray.push(itemEntity);
        console.log(name, imgSrc);  // Use or store 'name' as needed
      }
      console.log(items.length);

      await filterButtons[i].click();
      // await page.waitForNavigation({ waitUntil: 'networkidle0' });
      await delay(300);
    }
    await browser.close();
    return itemsArray;
  }

  async crawlItemDetail(name: string) {
    const slug = slugify(name.toLowerCase(), {
      replacement: "-",
      lower: true, strict: false, locale: "en"
    });
    console.log(slug);
    return slug;
  }
}
