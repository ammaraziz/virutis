from setuptools import setup, find_packages
from setuptools.command.build_py import build_py
import glob
import os
import pkg_resources

from virutis import __version__, _program

setup(name='virutis',
      version=__version__,
      packages=find_packages(),
      scripts=[
            "virutis/scripts/virutis.smk",
            "virutis/scripts/mapper.sh"
            ],
      description='Virus Agnostic Bioinformatic pipeline to generate reads and consensus sequences for multigenotype viruses',
      package_data={"virutis":["resources/*"]},
      install_requires=["biopython>=1.70"],
      url='https://github.com/ammaraziz/virutis',
      author='Verity Hill',
      author_email=['verity.hill@yale.edu', 'ammar.aziz@mh.org.au'],
      entry_points="""
      [console_scripts]
      {program} = virutis.command:main
      """.format(program = _program),
      include_package_data=True,
      keywords=[],
      zip_safe=False)
