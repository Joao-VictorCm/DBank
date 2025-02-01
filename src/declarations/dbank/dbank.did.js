export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'checkbalance' : IDL.Func([], [IDL.Nat], ['query']),
    'downUp' : IDL.Func([IDL.Nat], [], ['oneway']),
    'topUp' : IDL.Func([IDL.Nat], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };
