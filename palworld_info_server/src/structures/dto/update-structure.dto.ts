import { PartialType } from "@nestjs/swagger";
import { CreateStructureDto } from "./create-structure.dto";
import { IsNumber, IsOptional, IsString } from "class-validator";
import { Column } from "typeorm";
import { StructureType } from "../entities/structure.entity";
import { ItemType } from "../../items/entities/item.entity";

export class UpdateStructureDto extends PartialType(CreateStructureDto) {
  @IsString()
  @IsOptional()
  name: string;

  @IsString()
  @IsOptional()
  iconUrl: string;

  @IsString()
  @IsOptional()
  slug: string;

  @IsString()
  @IsOptional()
  summary: string;

  @IsString()
  @IsOptional()
  structureType: StructureType;

  @IsNumber()
  @IsOptional() buildWork: number;

  @IsString()
  @IsOptional() energyType: string;

  @IsNumber()
  @IsOptional() consumeEnergySpeed: number;
}
