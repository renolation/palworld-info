import { Injectable } from "@nestjs/common";
import axios from "axios";
import * as cheerio from "cheerio";
import { PassiveDesc, PassiveSkill, PSkillPal } from "../../passive-skills/entities/passive-skill.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { QueryFailedError, Repository } from "typeorm";
import { Partner, PartnerPal } from "../entities/partner.entity";

@Injectable()
export class ElementService {
  constructor(
    @InjectRepository(PassiveDesc) private passiveDescRepository: Repository<PassiveDesc>,
    @InjectRepository(PassiveSkill) private passiveSkillRepository: Repository<PassiveSkill>,
    @InjectRepository(PSkillPal) private pSkillPalRepository: Repository<PSkillPal>,
    @InjectRepository(Partner) private partnerRepository: Repository<Partner>,
    @InjectRepository(PartnerPal) private partnerPalRepository: Repository<PartnerPal>
  ) {
  }

  async crawlElement() {
    try {
      const response = await axios.get("https://palworldtrainer.com/");
      const html = response.data;
      const $ = cheerio.load(html);

      const buttonsArray = Array.from($(".filterset.Elements").find(".filters").find("button")).map((button) => {
        const imgTag = $(button).find("img");
        const imgUrl = imgTag.attr("src");
        const imgAlt = imgTag.attr("alt").replace(" Icon", "");
        return { name: imgAlt, iconUrl: imgUrl };
      });
      // console.log('Buttons Array:', buttonsArray);

      return buttonsArray;
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }


  async crawlPartner() {
    try {
      const response = await axios.get("https://palworldtrainer.com/pal");
      const html = response.data;
      const $ = cheerio.load(html);
      return Array.from($(".filterset.Partner.Skill").find(".filters").find("button")).map((button) => {
        const imgTag = $(button).find("img");
        const imgUrl = imgTag.attr("src");
        const imgAlt = imgTag.attr("alt").replace(" Icon", "");
        return { name: imgAlt, iconUrl: imgUrl };
      });
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async crawlWork() {
    try {
      const response = await axios.get("https://palworldtrainer.com/");
      const html = response.data;
      const $ = cheerio.load(html);

      const buttonsArray = Array.from($(".filterset.Work.Suitability").find(".filters").find("button")).map((button) => {
        const imgTag = $(button).find("img");
        const imgUrl = imgTag.attr("src");
        const imgAlt = imgTag.attr("alt").replace(" Icon", "");
        return { name: imgAlt, iconUrl: imgUrl };
      });
      // console.log('Buttons Array:', buttonsArray);

      return buttonsArray;
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async crawlPals() {
    try {
      const response = await axios.get("https://palworldtrainer.com/");
      const html = response.data;
      const $ = cheerio.load(html);

      const palNamesArray = Array.from($(".content .card")).map((card) => {
        const palNameElement = $(card).find(".h6.pal-name");
        return palNameElement.text();
      });
      return palNamesArray;


    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async crawlSummary(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const $ = cheerio.load(response.data);
      return $(".content .summary").eq(0).find("p").text();
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async crawlPalIcon(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const html = response.data;
      const $ = cheerio.load(html);
      return $(".header .pal-statue .statue").attr("src");


    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async crawlPassiveSkillPal(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const html = response.data;
      const $ = cheerio.load(html);
      const pText = $("span:contains(\"Passive Skills\")").next("section");
      if (pText.html() === null) {
        console.log("No Passive Skills found. Skipping.");
        return Promise.resolve();
      }

      const nextElementsArr = $("span:contains(\"Passive Skills\")").nextUntil("span");
      let sections = [];

      nextElementsArr.each((i, e) => {
        if ($(e).prop("tagName") === "SECTION") {
          sections.push(e);
        }
      });

      let skills = [];

      for (const section of sections) {
        const text = $(section).text();
        const details = $(section).find("div.subhead span");

        let textArray = [];
        details.each((i, el) => {
          let text = $(el).text();

          // Remove "Rank " part from the second text
          if (i == 1) {
            text = text.replace("Rank ", "");
          }
          textArray.push(text);
        });

        const passiveSkill = await this.passiveSkillRepository.findOne({
          where: { name: textArray[0] }
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
          skills.push(pSkillPalEntity);
        } catch (error) {
          if (error instanceof QueryFailedError && error.message.includes("duplicate key value violates unique constraint")) {

            const existingRecord = await this.pSkillPalRepository.findOne({
              where: {
                passiveSkill: pSkillPalEntity.passiveSkill,
                rank: pSkillPalEntity.rank
              }
            });

            if (existingRecord) {
              console.log(`Id of duplicate record: ${existingRecord.id}`);
              console.log(`${existingRecord}`);
              skills.push(existingRecord);

            } else {
              console.log("Duplicate record not found");
            }

          } else {
            throw error;
          }
        }


      }


      return skills;

    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async createPartner(partner: { name: string; iconUrl: string }) {
    const partnerEntity = this.partnerRepository.create({
      ...partner
    });
    try {
      return await this.partnerRepository.save(partnerEntity);
    } catch (error) {
      if (error instanceof QueryFailedError && error.message.includes("duplicate key value violates unique constraint")) {
        console.error(error); // or throw e;
      }
    }
  }

  async crawlPartnerSkill(slug: string) {
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const html = response.data;
      const $ = cheerio.load(html);
      const pText = $("span:contains(\"Partner Skill\")").next("section");
      if (pText.html() === null) {
        console.log("No Passive Skills found. Skipping.");
        return Promise.resolve();
      }

      const details = pText.find(".header div.subhead div.title.partner-icon");

      const iconUrl = details.eq(0).find("img").attr("src");
      const name = details.eq(0).find("span").text();
      const desc = pText.find(".summary.ability .description").text();

      const partnerSkill = await this.partnerRepository.findOneBy({
        iconUrl: iconUrl
      });
      const partnerPalEntity = this.partnerPalRepository.create({
        ...{
          name: name,
          description: desc,
          partner: partnerSkill
        }
      });
      try {
        await this.partnerPalRepository.save(partnerPalEntity);
        return partnerPalEntity;
      } catch (error) {
        if (error instanceof QueryFailedError && error.message.includes("duplicate key value violates unique constraint")) {

          const existingRecord = await this.partnerPalRepository.findOne({
            where: {
              name: partnerPalEntity.name,
              partner: partnerPalEntity.partner
            }
          });

          if (existingRecord) {
            console.log(`Id of duplicate record: ${existingRecord.id}`);
            return existingRecord;
          } else {
            console.log("Duplicate record not found");
          }

        } else {
          throw error;
        }
      }
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }


}
