#!/usr/bin/env python

# check Python's version
import sys
if sys.version < '2.5':
    sys.stderr.write('This module requires at least Python 2.5\n')
    sys.exit(1)

# import statements
from distutils.core import setup, Extension

# Package data
def get_package_data():
    ret=[]
    for t in reduce(list.__add__, [
        '.git' not in d and [ os.path.join(d[len('src/goliat')+1:], e) for e in static_types ] or [] for (d, s, f) in os.walk(os.path.join('src/goliat', 'evoque'))
    ]):
        ret.append(t)
    for t in reduce(list.__add__, [
        '.git' not in d and [ os.path.join(d[len('src/goliat')+1:], e) for e in static_types ] or [] for (d, s, f) in os.walk(os.path.join('src/goliat', 'static'))
    ]):
        ret.append(t)
    for t in reduce(list.__add__, [
        '.git' not in d and [ os.path.join(d[len('src/goliat')+1:], e) for e in static_types ] or [] for (d, s, f) in os.walk(os.path.join('src/goliat', 'web'))
    ]):
        ret.append(t)
    return ret


# debug
DISTUTILS_DEBUG = False

classif = [
    'Development Status :: 4 - Beta',
    'Environment :: Console',
    'Environment :: Web Environment',
    'Intended Audience :: Developers',
    'Intended Audience :: System Administrators',
    'License :: OSI Approved :: GPLv2 License',
    'Operating System :: POSIX',
    'Programming Language :: Python',
    'Topic :: Software Development :: Libraries :: Web Services :: Python Modules'
    ]

setup(
    name='Goliat',
    version='0.1.1',
    description='Goliat Web Applications Framework',
    author='Open Phoenix IT S.Coop.And',
    author_email='oscar.campos@open-phoenix.com',
    maintainer='Oscar Campos Ruiz',
    maintainer_email='oscar.campos@open-phoenix.com',
    license='GPLv2 License',
    platforms='Linux',
    classifiers=classif,
    url='http://goliat.open-phoenix.com',
    download_url='http://github.com/downloads/DamnWidget/goliat/goliat-0.1.1.tar.bz2',
    py_modules=['goliat'],
    package_dir={'goliat': 'src/goliat'},
    package_data={'goliat': get_package_data()}
    install_requires=['twisted >= 10.0.0', 'storm >= 0.15', 'pyyaml >= 3.08'],
    requires=['twisted(>=10.0.0)', 'storm(>=0.15)', 'pyyaml(>=3.08)'],
    scripts=['src/goliat-mgr'],
    zip_safe=False,
    packages=[''],
    )
