import { Injectable } from "@nestjs/common";
import { CreatePassiveSkillDto } from "./dto/create-passive-skill.dto";
import { UpdatePassiveSkillDto } from "./dto/update-passive-skill.dto";
import axios from "axios";
import * as cheerio from "cheerio";
import { PassiveDesc, PassiveSkill, PSkillPal } from "./entities/passive_skill.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { QueryFailedError, Repository } from "typeorm";
import { ActiveSkill } from "./entities/active_skill.entity";
import { Partner, PartnerPal } from "../pals/entities/partner.entity";

@Injectable()
export class SkillsService {

  constructor(
    @InjectRepository(PassiveDesc) private passiveDescRepository: Repository<PassiveDesc>,
    @InjectRepository(PassiveSkill) private passiveSkillRepository: Repository<PassiveSkill>,
    @InjectRepository(PSkillPal) private pSkillPalRepository: Repository<PSkillPal>,
    @InjectRepository(ActiveSkill) private activeSkillRepository: Repository<ActiveSkill>,
    @InjectRepository(PartnerPal) private partnerPalRepository: Repository<PartnerPal>
  ) {
  }

  create(createPassiveSkillDto: CreatePassiveSkillDto) {
    return "This action adds a new passiveSkill";
  }

  async getAllPassiveSkills() {
    return await this.passiveSkillRepository.find(
      {
        order: {
          name: "ASC"
        },
        relations: {
          passiveDesc: true
        }
      }
    );
  }

  async getAllActiveSkills() {
    return await this.activeSkillRepository.find(
      {
        order: {
          name: "ASC"
        },
        relations: {
          element: true
        }
      }
    );
  }


  async getAllPartnerSkills() {
    const partners = await this.partnerPalRepository.find(
      {
        order: {
          name: "ASC"
        },
        relations: {
          pal: true,
          partner: true,
        }
      }
    );
    const result = [];

    partners.forEach(partner => {
      const { pal, ...partnerData } = partner;
      pal.forEach(singlePal => {
        result.push({ ...partnerData, pal: [singlePal] });
      });
    });
    return result;
  }

  async findAllPals() {
    return await this.pSkillPalRepository.find(
      {
        order: {
          rank: "ASC"
        },
        relations: {
          passiveSkill: {
            passiveDesc: true
          }

        }
      }
    );
  }

  findOne(id: number) {
    return `This action returns a #${id} passiveSkill`;
  }

  update(id: number, updatePassiveSkillDto: UpdatePassiveSkillDto) {
    return `This action updates a #${id} passiveSkill`;
  }

  remove(id: number) {
    return `This action removes a #${id} passiveSkill`;
  }

  async crawlPassiveSkill() {
    try {
      const response = await axios.get("https://palworldtrainer.com/skills/passive-skill");
      const html = response.data;
      const $ = cheerio.load(html);

      let skills: PassiveSkill[] = [];
      let elements = $(".content .table .row").get();
      for (let element of elements) {
        const skill = new PassiveSkill();

        // Get the name of the skill
        skill.name = $(element).find("p").first().text();
        console.log(skill.name);
        // Get stats of the skill
        let passiveDescriptions: PassiveDesc[] = [];

        $(element).find(".positive.stat, .negative.stat").each((i, statElement) => {
          const passiveDesc = new PassiveDesc();
          passiveDesc.name = $(statElement).text();
          passiveDesc.isPositive = $(statElement).hasClass("positive");
          passiveDescriptions.push(passiveDesc);
        });

        for (let passiveDesc of passiveDescriptions) {
          try {
            await this.passiveDescRepository.save(passiveDesc);
          } catch (error) {
            if (error instanceof QueryFailedError && error.message.includes("duplicate key value violates unique constraint")) {

              const existingRecord = await this.passiveDescRepository.findOne({
                where: {
                  name: passiveDesc.name,
                  isPositive: passiveDesc.isPositive
                }
              });
              if (existingRecord) {
                console.log(`Id of duplicate record: ${existingRecord.id}`);
                const index = passiveDescriptions.indexOf(passiveDesc);
                if (index > -1) {
                  passiveDescriptions[index] = existingRecord;
                }
              } else {
                console.log("Duplicate record not found");
              }

            }
          }

        }

        skill.passiveDesc = passiveDescriptions;

        try {
          await this.passiveSkillRepository.save(skill);
        } catch (error) {
          console.error("Error saving data:", error);

        }

        skills.push(skill);
      }

      console.log(skills);
      return skills;
    } catch (error) {
      console.error("Error executing crawlPassiveSkill method:", error);
    }
  }

}
