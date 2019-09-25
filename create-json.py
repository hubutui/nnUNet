#!/usr/bin/env python3
#
import argparse
import json
import os
import os.path as osp
from collections import OrderedDict


def getargs():
    parser = argparse.ArgumentParser()
    parser.add_argument('--inputdir', type=str, required=True,
                        help='input dir')
    parser.add_argument('--num_class', type=int, required=True,
                        help='number of class')

    return parser.parse_args()


if __name__ == '__main__':
    args = getargs()
    datadir = args.inputdir
    n = args.num_class
    json_dict = OrderedDict()
    json_dict['name'] = "MICCAI"
    # json_dict['description'] = "stomach cancer CT segmentation"
    json_dict['tensorImageSize'] = "4D"
    # json_dict['reference'] = "NA"
    # json_dict['licence'] = "NA"
    # json_dict['release'] = "1.0"
    json_dict['modality'] = {
        "0": "CT",
    }
    json_dict['labels'] = {
        "0": "background"
    }
    for idx in range(n):
        json_dict[str(idx)] = "class{}".format(idx+1)

    json_dict['training'] = [{'image': "./imagesTr/{}".format(imgfile),
                              'label': "./labelsTr/{}".format(maskfile)}
                             for imgfile, maskfile in zip(sorted(os.listdir(osp.join(datadir, 'imagesTr'))),
                                                          sorted(os.listdir(osp.join(datadir, 'labelsTr'))))]
    json_dict['test'] = ["./imagesTs/{}".format(imgfile)
                         for imgfile in os.listdir(osp.join(datadir, 'imagesTs'))]
    json_dict['numTraining'] = len(json_dict['training'])
    json_dict['numTest'] = len(json_dict['test'])
    with open(osp.join(datadir, 'dataset.json'), 'w') as f:
        json.dump(json_dict, f)
