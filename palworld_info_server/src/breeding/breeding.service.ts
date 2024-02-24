import { Injectable } from '@nestjs/common';
import { CreateBreedingDto } from './dto/create-breeding.dto';
import { UpdateBreedingDto } from './dto/update-breeding.dto';
import puppeteer from 'puppeteer-extra';

function delay(time: number) {
  return new Promise(function(resolve) {
    setTimeout(resolve, time);
  });
}

@Injectable()
export class BreedingService {
  create(createBreedingDto: CreateBreedingDto) {
    return 'This action adds a new breeding';
  }

  findAll() {
    return `This action returns all breeding`;
  }

  findOne(id: number) {
    return `This action returns a #${id} breeding`;
  }

  update(id: number, updateBreedingDto: UpdateBreedingDto) {
    return `This action updates a #${id} breeding`;
  }

  remove(id: number) {
    return `This action removes a #${id} breeding`;
  }

  async crawlBreeding() {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setUserAgent('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3');
    await page.goto('https://palworldtrainer.com/breed-calculator');
    const selectPal = await page.$$('section .change-card');
    await selectPal[0].click();
    await delay(300);
    const filterButtons = await page.$$('.modal .content .body .h6.pal-name');
    for (let i = 0; i < filterButtons.length; i++) {
      const buttonText = await page.evaluate(el => el.textContent, filterButtons[i]);
      await filterButtons[i].click();

      console.log(buttonText);
      const secondColumn = await page.$$('.page-content > .column:nth-of-type(2) .content div.row');
      for (let j = 0; j < secondColumn.length; j++) {
        let name = await page.evaluate(el => el.querySelector('p')?.textContent, secondColumn[j]);
        console.log(name);
      }

    }
    await browser.close();
  }
}
