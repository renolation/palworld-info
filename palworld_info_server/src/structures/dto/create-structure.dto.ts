import { IsNotEmpty, IsString } from 'class-validator';

export class CreateStructureDto {

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @IsNotEmpty()
  iconUrl: string;

    @IsString()
  @IsNotEmpty()
  structureType: string;

}
