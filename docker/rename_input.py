#!/usr/bin/env python3
#
import os
import os.path as osp
import shutil


if __name__ == '__main__':
    count = 0
    inputDir = os.getenv("INPUTDIR")
    if not osp.exists('/tmpdir'):
        os.makedirs('/tmpdir')

    print("start renaming...")
    for filename in os.listdir(inputDir):
        oldpath = osp.join(inputDir, filename)
        if osp.isfile(oldpath):
            newpath = osp.join('tmpdir', filename.replace('.nii.gz', '_seg_0000.nii.gz'))
            print('copy {} to {}'.format(oldpath, newpath))
            shutil.copyfile(oldpath, newpath)
            count += 1
    print("{} files processed".format(count))
    print("Done")
