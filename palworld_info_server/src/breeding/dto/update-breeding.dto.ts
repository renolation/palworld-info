import { PartialType } from '@nestjs/swagger';
import { CreateBreedingDto } from './create-breeding.dto';

export class UpdateBreedingDto extends PartialType(CreateBreedingDto) {}
