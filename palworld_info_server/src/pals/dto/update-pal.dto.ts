import { PartialType } from '@nestjs/mapped-types';
import { CreatePalDto } from './create-pal.dto';

export class UpdatePalDto extends PartialType(CreatePalDto) {}
