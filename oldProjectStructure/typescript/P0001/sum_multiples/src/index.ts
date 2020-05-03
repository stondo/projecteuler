import * as yargs from 'yargs';
import {contains, filter} from 'ramda';
import {Solution} from './Solution';

const argv = yargs
  .scriptName('sum-multiples')
  .usage('$0 <cmd> [args]')
  .command(
    'summ [first] [second] [below]',
    'Calculates the sum of the two multiples below the limit.',
    (arg: yargs.Argv) => {
      arg
        .positional('first', {
          alias: 'f',
          type: 'number',
          describe: 'the first multiple',
        })
        .positional('second', {
          alias: 's',
          type: 'number',
          describe: 'the second multiple',
        })
        .positional('below', {
          alias: 'b',
          type: 'number',
          describe: 'the upper limit',
        });
    },
    arg => {
      const first = arg.first as number;
      const second = arg.second as number;
      const below = arg.below as number;

      const cliArgs = [first, second, below];

      if (
        !contains(NaN, cliArgs) &&
        filter(n => n >= 0, cliArgs).length === 3
      ) {
        const ans = Solution.sumAllMultiplesOfBelow(first, second, below);
        console.log(
          'The sum of the multiples of',
          first,
          'and',
          second,
          'below',
          below,
          'is:',
          ans
        );
      } else {
        console.log('error: please enter only postiive integers');
      }
    }
  )
  .demandOption(
    ['first', 'second', 'below'],
    'Please provide 3 positive integers.'
  )
  .help().argv;

// console.log('this is argv: ', argv);
