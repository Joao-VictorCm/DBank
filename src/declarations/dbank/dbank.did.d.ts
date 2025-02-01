import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'checkbalance' : () => Promise<bigint>,
  'downUp' : (arg_0: bigint) => Promise<undefined>,
  'topUp' : (arg_0: bigint) => Promise<undefined>,
}
