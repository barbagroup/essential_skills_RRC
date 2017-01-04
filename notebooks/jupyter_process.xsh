import nbformat
from nbconvert.preprocessors import ExecutePreprocessor

notebooks = g`jupyter/*.ipynb`
for nb in notebooks:
    print('Opening notebook {}'.format(nb))
    with open(nb) as f:
        note = nbformat.read(f, as_version=4)
    ep = ExecutePreprocessor(timeout=600, kernel_name='python3', allow_errors=True)
    print('Executing notebook...')
    ep.preprocess(note, {'metadata': {'path': 'jupyter/'}})

    with open('{}_execute.ipynb'.format(nb.rstrip('.ipynb')), 'wt') as f:
        nbformat.write(note, f)

cd jupyter
# convert executed notebooks to markdown
notebooks = g`*_execute.ipynb`
for i, nb in enumerate(notebooks):
    print('Converting notebook {} to markdown...'.format(i))
    jupyter nbconvert --to markdown @(nb)
    sed -i 's/\.\/figures/\.\.\/figures/g' *.md
    mv @(nb.rstrip('.ipynb')+'.md') @('../../docs/jupyter/{}.md'.format(i+1))

cd ..

print('Removing executed notebooks')
/usr/bin/rm jupyter/*_execute.ipynb
/usr/bin/rm -r ../docs/jupyter/*_execute_files

print('Copying any generated figures to docs')
cd jupyter
mv *_execute_files ../../docs/jupyter/
cd ..
