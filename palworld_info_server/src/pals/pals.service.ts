import { Injectable } from '@nestjs/common';
import { CreatePalDto } from './dto/create-pal.dto';
import { UpdatePalDto } from './dto/update-pal.dto';

@Injectable()
export class PalsService {
  create(createPalDto: CreatePalDto) {
    return 'This action adds a new pal';
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
