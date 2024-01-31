import { PartialType } from '@nestjs/mapped-types';
import { CreatePalDto } from './create-pal.dto';
import { IsString, IsNotEmpty, IsNumber, IsOptional } from 'class-validator';

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