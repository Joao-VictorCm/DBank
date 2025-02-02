import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'checkbalance' : () => Promise<number>,
  'compound' : () => Promise<undefined>,
  'downUp' : (arg_0: number) => Promise<undefined>,
  'topUp' : (arg_0: number) => Promise<undefined>,
}
