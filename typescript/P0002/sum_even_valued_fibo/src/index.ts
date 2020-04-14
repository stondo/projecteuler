import * as yargs from 'yargs';
import {contains, filter} from 'ramda';
import {Solution} from './Solution';

const argv = yargs
  .scriptName('sum-even-valued-fibo')
  .usage('$0 <cmd> [args]')
  .command(
    'sumevf [below]',
    'Calculates the sum of the even valued fibo below the limit.',
    (arg: yargs.Argv) => {
      arg
        .positional('below', {
          alias: 'b',
          type: 'number',
          describe: 'the upper limit',
        });
    },
    arg => {
      const below = arg.below as number;

      const cliArgs = [below];

      if (
        !contains(NaN, cliArgs) &&
        filter(n => n >= 0, cliArgs).length === 1
      ) {
        const ans = Solution.sumEvenValuedFiboBelow(below);
        console.log(
          'The sum of the even-valued terms of the Fibonacci sequence below below 4000000',
          below,
          'is:',
          ans
        );
      } else {
        console.log('error: please enter only 1 postiive integer');
      }
    }
  )
  .demandOption(
    ['below'],
    'please enter only 1 postiive integer'
  )
  .help().argv;

// console.log('this is argv: ', argv);
