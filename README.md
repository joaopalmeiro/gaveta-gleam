# r-tables

Some examples of tables created in R.

## Quickstart

If necessary, install [Anaconda](https://docs.anaconda.com/anaconda/install/) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) first, please.

- `make init`.
- `make rstudio`.

## Notes

- Conda environment:
  - `conda create --no-default-packages -n r-tables -c r r-base=3.6.3`.
  - `conda activate r-tables`.
  - `conda install -c r rstudio`.
  - `conda install -c r r-reactable`.
  - `conda env export > environment.yml`.
  - `conda remove -n r-tables --all`.
