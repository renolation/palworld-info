import { PartialType } from "@nestjs/swagger";
import { CreateItemDto } from "./create-item.dto";
import { IsNotEmpty, IsNumber, IsOptional, IsString } from "class-validator";
import { ItemType } from "../entities/item.entity";

export class UpdateItemDto extends PartialType(CreateItemDto) {
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
  itemType: ItemType;

  @IsString()
  @IsOptional()
  rank: number;

  @IsNumber()
  @IsOptional()
  price: number;

  @IsNumber()
  @IsOptional()
  weight: number;

  @IsNumber()
  @IsOptional()
  maxStackCount: number;

  @IsNumber()
  @IsOptional()
  physAttack: number;

  @IsNumber()
  @IsOptional()
  durability: number;

  @IsNumber()
  @IsOptional()
  restoreConcentration: number;

  @IsNumber()
  @IsOptional()
  restoreSatiety: number;

  @IsString()
  @IsOptional()
  passiveSkill: string;
}
