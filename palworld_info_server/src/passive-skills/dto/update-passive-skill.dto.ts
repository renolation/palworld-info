import { PartialType } from '@nestjs/swagger';
import { CreatePassiveSkillDto } from './create-passive-skill.dto';

export class UpdatePassiveSkillDto extends PartialType(CreatePassiveSkillDto) {}
