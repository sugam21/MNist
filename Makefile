help: 
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

conda-update:
	conda env update --prune -f environment.yml
	echo "!!! Activate the environment using conda activate mlops_env"
	pip install poetry

asdf:
	asdf install
	echo "Setting local python version 3.10.12"
	asdf local python 3.10.12
	echo "Setting local poetry version 1.8.4"
	asdf local poetry 1.8.4

poetry:
	echo "Making virtual environment to be in the project directory itself."
	poetry config virtualenvs.in-project true
	poetry install

trial:
	python \
	training/run_experiment.py \
	fit \
	--trainer.fast_dev_run 10 \
	--model Model1 \
	--data DataModule1 

train_mnist_cnn_dpp:
	python \
	training/run_experiment.py \
	fit \
	--trainer.max_epochs 10 \
	--model Model1 \
	--data DataModule1 \

