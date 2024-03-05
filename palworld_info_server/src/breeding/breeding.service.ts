import { Injectable } from '@nestjs/common';
import { CreateBreedingDto } from './dto/create-breeding.dto';
import { UpdateBreedingDto } from './dto/update-breeding.dto';
import puppeteer from 'puppeteer-extra';
import { BreedingEntity } from './entities/breeding.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { ItemEntity } from '../items/entities/item.entity';
import { Like, Repository } from 'typeorm';

function delay(time: number) {
  return new Promise(function(resolve) {
    setTimeout(resolve, time);
  });
}

@Injectable()
export class BreedingService {

  constructor(
    @InjectRepository(BreedingEntity) private repo: Repository<BreedingEntity>,
  ) {
  }

  async create(createBreedingDto: CreateBreedingDto) {
    return 'This action adds a new breeding';
  }

  async createBreeding(breeding: BreedingEntity) {
    let existBreedingEntity = await this.repo.findOne({
      where: {
        parent1: breeding.parent1,
        parent2: breeding.parent2,
        child: breeding.child,
      },
    });
    if (existBreedingEntity) {
      return;
    }
    const breedingEntity = this.repo.create({ ...breeding });
    await this.repo.save(breedingEntity);
  }

  async findAll() {
    return await this.repo.find({});
  }

  findOne(id: number) {
    return `This action returns a #${id} breeding`;
  }

  async findByParent(keyword: string) {
    console.log(keyword);
    let result = await this.repo.find({
      where: [
        { parent1: Like(`%${keyword}%`) },
        { parent2: Like(`%${keyword}%`) },
      ],
    });
    result.forEach(entity => {
      if (entity.parent1 !== entity.parent2 && entity.parent2.includes(keyword)) {
        // swap their values
        [entity.parent1, entity.parent2] = [entity.parent2, entity.parent1];
      }
    });
    return result;
  }

  update(id: number, updateBreedingDto: UpdateBreedingDto) {
    return `This action updates a #${id} breeding`;
  }

  remove(id: number) {
    return `This action removes a #${id} breeding`;
  }

  async findByChild(keyword: string): Promise<BreedingEntity[]> {
    return await this.repo.find({
      where: {
        child: Like(`%${keyword}%`),
      },
    });
  }

  async crawlBreeding() {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setUserAgent('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3');
    await page.goto('https://palworldtrainer.com/breed-calculator');
    const selectPal = await page.$('section .change-card');
    await selectPal.click();
    await delay(300);
    let filterButtons = await page.$$('.modal .content .body .h6.pal-name');
    let length = filterButtons.length;

    for (let i = 0; i < length; i++) {
      if (i > 0) {
        await selectPal.click();
      }
      await delay(1000);
      let filters = await page.$$('.modal .content .body .h6.pal-name');
      await filters[i].click();
      await delay(1000);

      const secondColumn = await page.$$('.page-content > .column:nth-of-type(2) .content div.row');
      const buttonText = await page.evaluate(el => el.textContent, filterButtons[i]);
      let arrayChild = await this.findByChild(buttonText);

      if (arrayChild.length < secondColumn.length) {
        for (let j = 0; j < secondColumn.length; j++) {
          let buttons = await page.evaluateHandle(el => el.querySelectorAll('button'), secondColumn[j]);
          let parent1 = await page.evaluate((buttons, j) => buttons[j]?.textContent, buttons, 0);  // Retrieves the first button's text
          let parent2 = await page.evaluate((buttons, j) => buttons[j]?.textContent, buttons, 1);  // Retrieves the second button's text
          let child = await page.evaluate(el => el.querySelector('p')?.textContent, secondColumn[j]);
          let breeding = new BreedingEntity();
          breeding.parent1 = parent1;
          breeding.parent2 = parent2;
          breeding.child = child;
          await this.createBreeding(breeding);
          console.log(`parent 1 ${parent1} - parent2 ${parent2} - child ${child}`);
        }
      }

    }
    await browser.close();
  }
}
