#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from config import cfg, get_output_dir, get_output_file, get_input_dir


class Constructer():

    def __init__(self):
        self._index = 0

    def run(self):
        # os.walk()返回一个三元素的tuple：当前路径、子文件夹名称、文件列表。
        # for root, dirs, files in os.walk():
            # for filename in files:
                # print filename
            # for dirname in dirs:
                # print dirname

        file_dict = dict()
        key_index = len(get_input_dir().split(os.path.sep))

        for root, dirs, files in os.walk(get_input_dir()):
            for filename in files:
                path = os.path.join(root, filename)
                path_list = path.split(os.path.sep)
                _, path_ext = os.path.splitext(path)
                if path_ext != '.txt':
                    continue
                self._index += 1

                key = path_list[key_index]

                if key in file_dict.keys():
                    file_dict[key].writelines('%\n')
                else:
                    file_dict[key] = open(get_output_file(key), 'w')

                with open(path, 'r') as f:
                    title_poetry = f.readline().strip()
                    dynasty_poetry = f.readline().strip()
                    author_poetry = f.readline().strip()
                    content_poetry = f.read().strip()

                file_dict[key].writelines(
                    cfg.FORMAT_TITLE.format(title_poetry))
                file_dict[key].writelines(
                    cfg.FORMAT_DYNASTY.format(dynasty_poetry))
                file_dict[key].writelines(
                    cfg.FORMAT_AUTHOR.format(author_poetry))
                file_dict[key].writelines(
                    cfg.FORMAT_CONTENT.format(content_poetry))

                print '-----------------------------------------------------------'
                print key, path
                print 'Constructer: ', self._index
                print '标题：', title_poetry
                print '朝代：', dynasty_poetry
                print '作者：', author_poetry
                print '原文：\n', content_poetry

        for key in file_dict.keys():
            file_dict[key].close()


if __name__ == '__main__':
    print 'start'

    c = Constructer()
    c.run()
