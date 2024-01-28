import { Test, TestingModule } from '@nestjs/testing';
import { PalsController } from './pals.controller';
import { PalsService } from './pals.service';

describe('PalsController', () => {
  let controller: PalsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PalsController],
      providers: [PalsService],
    }).compile();

    controller = module.get<PalsController>(PalsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
