import { PartialType } from '@nestjs/swagger';
import { CreateStructureDto } from './create-structure.dto';

export class UpdateStructureDto extends PartialType(CreateStructureDto) {}
