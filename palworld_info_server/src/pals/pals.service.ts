import { Injectable } from "@nestjs/common";
import { CreatePalDto } from "./dto/create-pal.dto";
import { UpdatePalDto } from "./dto/update-pal.dto";
import { Pal } from "./entities/pal.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Element } from "./entities/element.entity";
import { WorkSuitability } from "./entities/work_suitability.entity";

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

  remove(id: number) {
    return `This action removes a #${id} pal`;
  }
}
