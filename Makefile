.PHONY: install test upload docs


install:
	pip install -e .[docs,test]

format:
	isort src tests
	black src/ tests/

test:
	py.test

retest:
	py.test -vvv --lf

coverage:
	py.test --cov=django_healthchecks --cov-report=term-missing --cov-report=html

docs:
	$(MAKE) -C docs html

release:
	rm -rf dist/*
	python setup.py sdist bdist_wheel
	twine upload dist/*
