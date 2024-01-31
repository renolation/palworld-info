import { IsString, IsNotEmpty, IsNumber, IsArray, IsOptional } from "class-validator";
import { Element } from "../entities/element.entity";

export class CreatePalDto {

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  title: string;

  @IsString()
  slug: string;

  @IsArray()
  element: Element[]

  @IsString()
  size: string;

  @IsNumber()
  rarity: number;

  @IsNumber()
  hp: number;

  @IsNumber()
  meleeAttack: number;

  @IsNumber()
  magicAttack: number;

  @IsNumber()
  defense: number;

  @IsNumber()
  support: number;

  @IsNumber()
  craftSpeed: number;

  @IsNumber()
  captureRate: number;

  @IsNumber()
  price: number;

  @IsNumber()
  slowWalkSpeed: number;

  @IsNumber()
  runSpeed: number;

  @IsNumber()
  rideSprintSpeed: number;

  @IsNumber()
  foodAmount: number;

  @IsNumber()
  maleProbability: number;
}