import { PartialType } from "@nestjs/mapped-types";
import { CreatePalDto } from "./create-pal.dto";
import { IsString, IsNotEmpty, IsNumber, IsOptional, IsArray } from "class-validator";
import { LevelWorkSuitability } from "../entities/work_suitability.entity";
import { Element } from "../entities/element.entity";
import { PSkillPal } from '../../passive-skills/entities/passive-skill.entity';
import { PartnerPal } from "../entities/partner.entity";

export class UpdatePalDto extends PartialType(CreatePalDto) {

  @IsString()
  @IsOptional()
  name: string;

  @IsString()
  @IsOptional()
  title: string;

  @IsString()
  @IsOptional()
  slug: string;

  @IsArray()
  @IsOptional()
  element: Element[];

  levelWorkSuitability: LevelWorkSuitability[];

  passiveSkill: PSkillPal;

  partnerPal: PartnerPal;

  @IsString()
  @IsOptional()
  iconUrl: string;

  @IsString()
  @IsOptional()
  summary: string;

  @IsString()
  @IsOptional()
  size: string;

  @IsNumber()
  @IsOptional()
  rarity: number;

  @IsNumber()
  @IsOptional()
  hp: number;

  @IsNumber()
  @IsOptional()
  meleeAttack: number;

  @IsNumber()
  @IsOptional()
  magicAttack: number;

  @IsNumber()
  @IsOptional()
  defense: number;

  @IsNumber()
  @IsOptional()
  support: number;

  @IsNumber()
  @IsOptional()
  craftSpeed: number;

  @IsNumber()
  @IsOptional()
  captureRate: number;

  @IsNumber()
  @IsOptional()
  price: number;

  @IsNumber()
  @IsOptional()
  slowWalkSpeed: number;

  @IsNumber()
  @IsOptional()
  runSpeed: number;

  @IsNumber()
  @IsOptional()
  rideSprintSpeed: number;

  @IsNumber()
  @IsOptional()
  foodAmount: number;

  @IsNumber()
  @IsOptional()
  maleProbability: number;
}