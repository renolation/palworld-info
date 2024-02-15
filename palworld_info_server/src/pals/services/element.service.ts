import { Injectable } from '@nestjs/common';
import axios from 'axios';
import * as cheerio from 'cheerio';
import { PassiveDesc, PassiveSkill, PSkillPal } from '../../passive-skills/entities/passive-skill.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Pal } from '../entities/pal.entity';
import { QueryFailedError, Repository } from 'typeorm';
import { Element } from '../entities/element.entity';
import { LevelWorkSuitability, WorkSuitability } from '../entities/work_suitability.entity';

@Injectable()
export class ElementService {
  constructor(
    @InjectRepository(PassiveDesc) private passiveDescRepository: Repository<PassiveDesc>,
    @InjectRepository(PassiveSkill) private passiveSkillRepository: Repository<PassiveSkill>,
    @InjectRepository(PSkillPal) private pSkillPalRepository: Repository<PSkillPal>,
  ) {
  }

  async crawlElement() {
    try {
      const response = await axios.get('https://palworldtrainer.com/');
      const html = response.data;
      const $ = cheerio.load(html);

      const buttonsArray = Array.from($('.filterset.Elements').find('.filters').find('button')).map((button) => {
        const imgTag = $(button).find('img');
        const imgUrl = imgTag.attr('src');
        const imgAlt = imgTag.attr('alt').replace(' Icon', '');
        return { name: imgAlt, iconUrl: imgUrl };
      });
      // console.log('Buttons Array:', buttonsArray);

      return buttonsArray;
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  async crawlWork() {
    try {
      const response = await axios.get('https://palworldtrainer.com/');
      const html = response.data;
      const $ = cheerio.load(html);

      const buttonsArray = Array.from($('.filterset.Work.Suitability').find('.filters').find('button')).map((button) => {
        const imgTag = $(button).find('img');
        const imgUrl = imgTag.attr('src');
        const imgAlt = imgTag.attr('alt').replace(' Icon', '');
        return { name: imgAlt, iconUrl: imgUrl };
      });
      // console.log('Buttons Array:', buttonsArray);

      return buttonsArray;
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  async crawlPals() {
    try {
      const response = await axios.get('https://palworldtrainer.com/');
      const html = response.data;
      const $ = cheerio.load(html);

      const palNamesArray = Array.from($('.content .card')).map((card) => {
        const palNameElement = $(card).find('.h6.pal-name');
        return palNameElement.text();
      });
      return palNamesArray;


    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  async crawlSummary(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const $ = cheerio.load(response.data);
      return $('.content .summary').eq(0).find('p').text();
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  async crawlPalIcon(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const html = response.data;
      const $ = cheerio.load(html);
      return $('.header .pal-statue .statue').attr('src');


    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  async crawlPassiveSkillPal(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const html = response.data;
      const $ = cheerio.load(html);
      const pText = $('span:contains("Passive Skill")').next('section');
      const details = pText.find('div.subhead span');
      let textArray = [];
      details.each((i, el) => {
        let text = $(el).text();

        // Remove "Rank " part from the second text
        if (i == 1) {
          text = text.replace('Rank ', '');
        }
        textArray.push(text);
      });

      const passiveSkill = await this.passiveSkillRepository.findOne({
        where: { name: textArray[0] },
      });
      if (!passiveSkill) {
        throw new Error(`Passive skill with name ${textArray[0]} not found`);
      }
      const pSkillPal = new PSkillPal();
      pSkillPal.passiveSkill = passiveSkill;
      pSkillPal.rank = textArray[1];

      const pSkillPalEntity = this.pSkillPalRepository.create(pSkillPal);

      try {
        await this.pSkillPalRepository.save(pSkillPalEntity);
        return pSkillPalEntity;
      } catch (error) {
        if (error instanceof QueryFailedError && error.message.includes('duplicate key value violates unique constraint')) {

          const existingRecord = await this.pSkillPalRepository.findOne({
            where: {
              passiveSkill: pSkillPalEntity.passiveSkill,
              rank: pSkillPalEntity.rank,
            },
          });

          if (existingRecord) {
            console.log(`Id of duplicate record: ${existingRecord.id}`);
            return existingRecord;
          } else {
            console.log('Duplicate record not found');
          }

        } else {
          throw error;
        }
      }
      return textArray;

    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }


}
