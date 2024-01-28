import { Injectable } from "@nestjs/common";
import { CreatePalDto } from "./dto/create-pal.dto";
import { UpdatePalDto } from "./dto/update-pal.dto";
import { Pal } from "./entities/pal.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Element } from "./entities/element.entity";

@Injectable()
export class PalsService {

  constructor(
    @InjectRepository(Pal) private repo: Repository<Pal>,
    @InjectRepository(Element) private elementsRepo: Repository<Element>,
  ) {
  }

  create(createPalDto: CreatePalDto) {
    return "This action adds a new pal";
  }

  async createElement(name: string, iconUrl: string){
    const elementEntity = this.elementsRepo.create({
      ...{name, iconUrl},
    });
    // console.log(elementEntity);
    await this.elementsRepo.save(elementEntity);
    // return JSON.stringify(elementEntity);
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
