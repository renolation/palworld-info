import { IsNotEmpty, IsString } from 'class-validator';

export class CreateItemDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @IsNotEmpty()
  iconUrl: string;

  @IsString()
  @IsNotEmpty()
  itemType: string;
}
