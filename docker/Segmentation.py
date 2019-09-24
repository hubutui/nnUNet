#!/usr/bin/env python3
#
import subprocess


if __name__ == '__main__':
    # task = os.getenv('TASK_NAME')
    # if task is None:
    #     raise RuntimeError("TASK_NAME environment viariable not set")
    # cmd = {
    #     'Task01_HaNOAR': "/nnUNet/docker/run-task01.sh",
    #     'Task02_NasoGTV': "/nnUNet/docker/run-task02.sh",
    #     'Task03_ThoracicOAR': "/nnUNet/docker/run-task03.sh",
    #     'Task04_LungGTV': "/nnUNet/docker/run-task04.sh"}
    # if task not in cmd.keys():
    #     raise RuntimeError("Not script to run for task: {}".format(task))
    # subprocess.call(cmd[task])
    subprocess.call("/nnUNet/docker/run-structseg.sh")

