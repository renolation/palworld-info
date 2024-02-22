import { Injectable } from '@nestjs/common';
import { CreateStructureDto } from './dto/create-structure.dto';
import { UpdateStructureDto } from './dto/update-structure.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { StructureEntity, StructureType } from './entities/structure.entity';
import puppeteer from 'puppeteer-extra';
function delay(time: number) {
  return new Promise(function(resolve) {
    setTimeout(resolve, time);
  });
}
@Injectable()
export class StructuresService {

  constructor(
    @InjectRepository(StructureEntity) private repo: Repository<StructureEntity>,
  ) {
  }

  async create(createStructureDto: CreateStructureDto) {
    const existingStructure = await this.repo.findOne({
      where: { name: createStructureDto.name },
    });

    if (existingStructure) {
      return;
    }

    const structureEntity = this.repo.create(
      {
        name: createStructureDto.name,
        iconUrl: createStructureDto.iconUrl,
        structureType: StructureType[createStructureDto.structureType],
      },
    );
    try {
      await this.repo.save(structureEntity);
    } catch (error) {
      throw error;
    }
  }

  findAll() {
    return `This action returns all structures`;
  }

  findOne(id: number) {
    return `This action returns a #${id} structure`;
  }

  update(id: number, updateStructureDto: UpdateStructureDto) {
    return `This action updates a #${id} structure`;
  }

  remove(id: number) {
    return `This action removes a #${id} structure`;
  }

  async crawlStructures(): Promise<StructureEntity[]> {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setUserAgent('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3');
    await page.goto('https://palworldtrainer.com/structures');
    const filterButtons = await page.$$('.sidebar .content .filters .button.filter.text');
    let structuresArray = [];

    // console.log(filterButtons.length);
    for (let i = 0; i < filterButtons.length; i++) {


      const buttonText = await page.evaluate(el => el.textContent, filterButtons[i]);
      console.log(buttonText);

      await filterButtons[i].click();
      await delay(500); // waits for 3000ms = 3s
      console.log('aaa');
      const structures = await page.$$('div.page-body section.content a.card');
      // for(let i = 0; i<2; i++){
      for (const item of structures) {
        let name = await page.evaluate(el => el.querySelector('.item-name')?.textContent, item);
        let imgSrc = await page.evaluate(el => el.querySelector('img')?.getAttribute('src'), item);
        let structuresType = StructureType[buttonText];
        let structureEntity = new StructureEntity();
        structureEntity.name = name;
        structureEntity.iconUrl = imgSrc;
        structureEntity.structureType = structuresType;
        structuresArray.push(structureEntity);
        console.log(name, imgSrc);  // Use or store 'name' as needed
      }
      console.log(structures.length);

      await filterButtons[i].click();
      // await page.waitForNavigation({ waitUntil: 'networkidle0' });
      await delay(300);
    }
    await browser.close();
    return structuresArray;
  }

}
