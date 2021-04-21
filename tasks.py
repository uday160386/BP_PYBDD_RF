from pathlib import Path
import shutil

from docutils.core import publish_cmdline
from invoke import task


@task
def project_reports(ctx):
    """Generate reports.
    """
    args = ['--stylesheet=style.css,extra.css',
            '--link-stylesheet',
            'README.rst',
            'reports/index.html']
    publish_cmdline(writer_name='html5', argv=args)
    print(Path(args[-1]).absolute())


@task
def copy_reports(ctx):
    """copy report.html and log.html to reports
    """
    log = Path('./log.html')
    report = Path('./report.html')
    dest = Path('.') / 'reports'
    print(log.absolute())
    shutil.copy(log.absolute(), str(dest))
    print(report.absolute())
    shutil.copy(report.absolute(), str(dest))
