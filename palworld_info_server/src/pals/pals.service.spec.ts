import { Test, TestingModule } from '@nestjs/testing';
import { PalsService } from './pals.service';

describe('PalsService', () => {
  let service: PalsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PalsService],
    }).compile();

    service = module.get<PalsService>(PalsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
