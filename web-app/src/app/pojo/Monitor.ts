import { Tag } from './Tag';

export class Monitor {
  id!: number;
  name!: string;
  app!: string;
  host!: string;
  intervals: number = 60;
  // Monitoring status 0: Paused, 1: Up, 2: Down
  status!: number;
  description!: string;
  creator!: string;
  modifier!: string;
  gmtCreate!: number;
  gmtUpdate!: number;
  tags!: Tag[];
}
