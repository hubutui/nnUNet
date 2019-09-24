#!/usr/bin/env python3
import os
import os.path as osp
import argparse
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
    if not osp.exists(args.outputdir):
        os.makedirs(args.outputdir)
    for segfile in os.listdir(args.inputdir):
        oldname = osp.join(args.inputdir, segfile)
        if not osp.exists(osp.join(args.outputdir,
                                   segfile.split('-')[0])):
            os.makedirs(osp.join(args.outputdir,
                                   segfile.split('-')[0]))
        newname = osp.join(args.outputdir,
                           segfile.split('-')[0],
                           segfile.split('-')[-1].replace('data', 'predict'))
        print("rename {} to {}".format(oldname, newname))
        shutil.copyfile(oldname, newname)
    print("Done")

