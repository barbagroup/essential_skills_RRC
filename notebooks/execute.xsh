import nbformat
from nbconvert.preprocessors import ExecutePreprocessor

notebooks = g`numba/*.ipynb`
for nb in notebooks:
    print('Opening notebook {}'.format(nb))
    with open(nb) as f:
        note = nbformat.read(f, as_version=4)
    ep = ExecutePreprocessor(timeout=600, kernel_name='python3', allow_errors=True)
    print('Executing notebook...')
    ep.preprocess(note, {'metadata': {'path': 'numba/'}})

    with open('{}_execute.ipynb'.format(nb.rstrip('.ipynb')), 'wt') as f:
        nbformat.write(note, f)

# convert executed notebooks to markdown
notebooks = g`numba/*_execute.ipynb`
for i, nb in enumerate(notebooks):
    jupyter nbconvert --to markdown @(nb)
    sed -i 's/\.\figures/\.\./figures/g' *.md
    mv @(nb.rstrip('.ipynb')+'.md') @('../docs/numba/{}.md'.format(i+1))

/usr/bin/rm numba/*_execute.ipynb

mv numba/*_execute_files ../docs/numba/
