# -*- coding: utf-8 -*-

import os
import os.path as osp
import numpy as np
# `pip install easydict` if you don't have it
from easydict import EasyDict as edict

__C = edict()

cfg = __C

__C.ROOT_DIR = osp.abspath(osp.join(osp.dirname(__file__)))
__C.POETRY_DIR = 'gushiwen-crawler/data'

__C.FORMAT_TITLE = '\033[0;32m 《{}》\033[m\n'
__C.FORMAT_DYNASTY = '\033[0;31m朝代：{}\033[m\n'
__C.FORMAT_AUTHOR = '\033[0;33m作者：{}\033[m\n'
__C.FORMAT_CONTENT = '\033[0;37m{}\033[m\n'


def get_output_dir():
    outdir = osp.abspath(osp.join(__C.ROOT_DIR, 'data',))
    if not os.path.exists(outdir):
        os.makedirs(outdir)
    return outdir


def get_output_file(dynasty):
    outdir = osp.abspath(osp.join(__C.ROOT_DIR, 'data',))
    if not os.path.exists(outdir):
        os.makedirs(outdir)
    outfile = os.path.join(outdir, dynasty)
    return outfile


def get_input_dir():
    indir = osp.abspath(osp.join(__C.ROOT_DIR, __C.POETRY_DIR))
    assert os.path.exists(indir)
    return indir


def _merge_a_into_b(a, b):
    """Merge config dictionary a into config dictionary b, clobbering the
    options in b whenever they are also specified in a.
    """
    if not isinstance(a, edict):
        return

    for k, v in a.iteritems():
        # a must specify keys that are in b
        if k not in b:
            raise KeyError('{} is not a valid config key'.format(k))

        # the types must match, too
        old_type = type(b[k])
        if not isinstance(v, old_type):
            if isinstance(b[k], np.ndarray):
                v = np.array(v, dtype=b[k].dtype)
            else:
                raise ValueError(('Type mismatch ({} vs. {}) '
                                  'for config key: {}').format(type(b[k]),
                                                               type(v), k))

        # recursively merge dicts
        if isinstance(v, edict):
            try:
                _merge_a_into_b(a[k], b[k])
            except:
                print('Error under config key: {}'.format(k))
                raise
        else:
            b[k] = v


def cfg_from_file(filename):
    """Load a config file and merge it into the default options."""
    import yaml
    with open(filename, 'r') as f:
        yaml_cfg = edict(yaml.load(f))

    _merge_a_into_b(yaml_cfg, __C)


def cfg_from_list(cfg_list):
    """Set config keys via list (e.g., from command line)."""
    from ast import literal_eval
    assert len(cfg_list) % 2 == 0
    for k, v in zip(cfg_list[0::2], cfg_list[1::2]):
        key_list = k.split('.')
        d = __C
        for subkey in key_list[:-1]:
            assert subkey in d
            d = d[subkey]
        subkey = key_list[-1]
        assert subkey in d
        try:
            value = literal_eval(v)
        except:
            # handle the case when v is a string literal
            value = v
        assert isinstance(value, type(d[subkey])), \
            'type {} does not match original type {}'.format(
            type(value), type(d[subkey]))
        d[subkey] = value
