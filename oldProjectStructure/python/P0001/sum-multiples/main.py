import argparse
import sum_multiples

__version__ = '0.1.0'
__author__ = u'Stefano Tondo'

def get_parser():
    """
    Creates a new argument parser.
    """
    parser = argparse.ArgumentParser('SumMultiplesOf')
    version = '%(prog)s ' + __version__
    parser.add_argument('--version', '-v', action='version', version=version)
    parser.add_argument('--firstMultipleOf', '-f', 
                        help='First multiple', )
    parser.add_argument('--secondMultipleOf', '-s',
                        help='Second multiple', )
    parser.add_argument('--below', '-b',
                        help='Upper limit number', )
    return parser


def safe_cast(val, to_type, default=None):
    try:
        return to_type(val)
    except (ValueError, TypeError):
        return default

def check_input_args(args):
    return safe_cast(args.firstMultipleOf, int) != None and safe_cast(args.secondMultipleOf, int) != None and safe_cast(args.below, int) != None

def main(args=None):
    parser = get_parser()
    args = parser.parse_args(args)

    if check_input_args(args):
        result = 'The sum of the multiples of ' + \
            args.firstMultipleOf + ' and ' + args.secondMultipleOf + \
            ' below ' + args.below + ' is: '
        ans = sum_multiples.sumAllMultiplesOfBelow(safe_cast(args.firstMultipleOf, int), safe_cast(
            args.secondMultipleOf, int), safe_cast(args.below, int))
        print(result + str(ans))
    else:
        print('error: only integers allowed as input')


if __name__ == "__main__":
    main()
