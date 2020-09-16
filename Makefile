.PHONY: init manual_init remove rstudio export_env

CONDA_BASE=$(shell conda info --base)

init:
	conda env create -f environment.yml

manual_init:
	conda create -y --no-default-packages -n r-tables -c r r-base=3.6.3
	source $(CONDA_BASE)/etc/profile.d/conda.sh && \
	conda activate r-tables && \
	conda install -y -c r rstudio && \
	conda install -y -c r r-reactable

remove:
	conda remove -n r-tables --all

rstudio:
	source $(CONDA_BASE)/etc/profile.d/conda.sh && \
	conda activate r-tables && \
	rstudio

export_env:
	source $(CONDA_BASE)/etc/profile.d/conda.sh && \
	conda activate r-tables && \
	conda env export > environment.yml
