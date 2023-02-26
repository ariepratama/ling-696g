import pydrive
import argparse 

if __name__ == '__main__':
    argparser = argparse.ArgumentParser()
    # local source directory to be uploaded
    argparser.add_argument("--source_path")
    args = argparser.parse_args()

    source_path = args.source_path()

