import * as yargs from 'yargs';
import { contains, filter } from 'ramda';
import { Solution } from './Solution';

const argv = yargs
  .scriptName('laregest-prime-factor')
  .usage('$0 <cmd> [args]')
  .command(
    'lpf [number]',
    'Calculates the largest prima factor of the given number.',
    (arg: yargs.Argv) => {
      arg
        .positional('number', {
          alias: 'n',
          type: 'number',
          describe: 'the number to find the largest prime factor of',
        });
    },
    arg => {
      const num = arg.number as number;

      const cliArgs = [num];

      if (
        !contains(NaN, cliArgs) &&
        filter(n => n >= 0, cliArgs).length === 1
      ) {
        const ans = Solution.largestPrimeFactor(num);
        console.log(
          'The largest prime factor of',
          num,
          'is:',
          ans
        );
      } else {
        console.log('error: please enter only one postiive integer');
      }
    }
  )
  .demandOption(
    ['number'],
    'Please enter only one postiive integer.'
  )
  .help().argv;

// console.log('this is argv: ', argv);
