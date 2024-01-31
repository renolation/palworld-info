import { Injectable } from "@nestjs/common";
import { CreatePalDto } from "./dto/create-pal.dto";
import { UpdatePalDto } from "./dto/update-pal.dto";
import { Pal } from "./entities/pal.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Element } from "./entities/element.entity";
import { WorkSuitability } from "./entities/work_suitability.entity";
import axios from "axios";
import * as cheerio from "cheerio";
@Injectable()
export class PalsService {

  constructor(
    @InjectRepository(Pal) private repo: Repository<Pal>,
    @InjectRepository(Element) private elementsRepo: Repository<Element>,
    @InjectRepository(WorkSuitability) private workSuitabilityRepository: Repository<WorkSuitability>,

  ) {
  }

  create(createPalDto: CreatePalDto) {
    return "This action adds a new pal";
  }

  async createElement(name: string, iconUrl: string){
    const elementEntity = this.elementsRepo.create({
      ...{name, iconUrl},
    });
    await this.elementsRepo.save(elementEntity);
}

  async createWork(name: string, iconUrl: string){
    const workEntity = this.workSuitabilityRepository.create({
      ...{name, iconUrl},
    });
    await this.workSuitabilityRepository.save(workEntity);
  }

  async createPal(name: string){
    const palEntity = this.repo.create({
      ...{name},
    });
    await this.repo.save(palEntity);
  }

  findAll() {
    return `This action returns all pals`;
  }

  findOne(id: number) {
    return `This action returns a #${id} pal`;
  }

  update(id: number, updatePalDto: UpdatePalDto) {
    return `This action updates a #${id} pal`;
  }

  async updatePal(slug: string, updatePalDto: UpdatePalDto) {
    const palToUpdate = await this.repo.findOne({ where: { slug } });

    if (!palToUpdate) {
      throw new Error(`Pal with ID: ${slug} not found.`);
    }

    const updatedPal = this.repo.merge(palToUpdate, updatePalDto);
    await this.repo.save(updatedPal);

    return updatedPal;
  }

  remove(id: number) {
    return `This action removes a #${id} pal`;
  }

  //region crawl data
  async crawlPalData(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const $ = cheerio.load(response.data);
      const content = $('.pal');

      return {
        name: content.find('.header .pal-name').html(),
        title: content.find('.header .pal-title').html(),
        size: content.find('.row:has(.label:contains("Size")) .right .value').text(),
        rarity: content.find('.row:has(.label:contains("Rarity")) .right .value').text(),
        hp: content.find('.row:has(.label:contains("HP")) .right .value').text(),
        meleeAttack: content.find('.row:has(.label:contains("Melee Attack")) .right .value').text(),
        magicAttack: content.find('.row:has(.label:contains("Magic Attack")) .right .value').text(),
        defense: content.find('.row:has(.label:contains("Defense")) .right .value').text(),
        support: content.find('.row:has(.label:contains("Support")) .right .value').text(),
        craftSpeed: content.find('.row:has(.label:contains("Craft Speed")) .right .value').text(),
        captureRate: content.find('.row:has(.label:contains("Capture Rate")) .right .value').text(),
        price: content.find('.row:has(.label:contains("Price")) .right .value').text(),
        slowWalkSpeed: content.find('.row:has(.label:contains("Slow Walk Speed")) .right .value').text(),
        runSpeed: content.find('.row:has(.label:contains("Run Speed")) .right .value').text(),
        rideSprintSpeed: content.find('.row:has(.label:contains("Ride Sprint Speed")) .right .value').text(),
        foodAmount: content.find('.row:has(.label:contains("Food Amount")) .right .value').text(),
        maleProbability: content.find('.row:has(.label:contains("Male Probability")) .right .value').text()
      };
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }
  //endregion

}
