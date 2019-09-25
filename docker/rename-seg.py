#!/usr/bin/env python3
#
import argparse
import os
import os.path as osp
import shutil


def getargs():
    parser = argparse.ArgumentParser()
    parser.add_argument('--inputdir', type=str, default='/tmpdir-result',
                        help='input dir')
    parser.add_argument('--outputdir', type=str, default='/output',
                        help='output dir')

    return parser.parse_args()


if __name__ == '__main__':
    args = getargs()
    os.makedirs(args.outputdir, exist_ok=True)
    for segfile in os.listdir(args.inputdir):
        oldname = osp.join(args.inputdir, segfile)
        os.makedirs(osp.join(args.outputdir, segfile.split('-')[0]), exist_ok=True)
        newname = osp.join(args.outputdir,
                           segfile.split('-')[0],
                           segfile.split('-')[-1].replace('data', 'predict'))
        print("rename {} to {}".format(oldname, newname))
        shutil.copyfile(oldname, newname)
    print("Done")
