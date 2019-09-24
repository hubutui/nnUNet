#!/usr/bin/env python3
import os
import os.path as osp
import argparse
import shutil


def getargs():
    parser = argparse.ArgumentParser()
    parser.add_argument('--inputdir', type=str, default='/input',
                        help='input dir')
    parser.add_argument('--outputdir', type=str, default='/tmpdir',
                        help='output dir')

    return parser.parse_args()


if __name__ == '__main__':
    args = getargs()
    if not osp.exists(args.outputdir):
        os.makedirs(args.outputdir)
    for patient in os.listdir(args.inputdir):
        print("rename {} to {}...".format(osp.join(args.inputdir, patient, 'data.nii.gz'),
                                          osp.join(args.outputdir, "{}-data_0000.nii.gz".format(patient))))
        shutil.copyfile(osp.join(args.inputdir, patient, 'data.nii.gz'),
                        osp.join(args.outputdir, "{}-data_0000.nii.gz".format(patient)))
    print("Done")
