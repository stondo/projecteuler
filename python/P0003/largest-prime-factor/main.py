import argparse
import largest_prime_factor

__version__ = '0.1.0'
__author__ = u'Stefano Tondo'

def get_parser():
    """
    Creates a new argument parser.
    """
    parser = argparse.ArgumentParser('LargestPrimeFactor')
    version = '%(prog)s ' + __version__
    parser.add_argument('--version', '-v', action='version', version=version)
    parser.add_argument('--number', '-n',
                        help='The number to find the largest prime factor of', )
    return parser


def safe_cast(val, to_type, default=None):
    try:
        return to_type(val)
    except (ValueError, TypeError):
        return default

def check_input_args(args):
    return safe_cast(args.number, int) != None

def main(args=None):
    parser = get_parser()
    args = parser.parse_args(args)

    if check_input_args(args):
        result = 'The largest prime factor of ' + \
             args.number + ' is: '
        ans = largest_prime_factor.largestPrimeFactor(safe_cast(args.number, int))
        print(result + str(ans))
    else:
        print('error: only integers allowed as input')


if __name__ == "__main__":
    main()
