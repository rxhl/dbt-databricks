## dbt with Databricks

Using dbt core with Databricks

### 1. Local dbt setup

```
# 1. Clone the repo

# 2. Install Pipenv
$ pip3 install -u pipenv

# 3. Create a python virtual env
$ pipenv --python <YOUR_PYTHON_VERSION>

# 4. Install deps
$ pipenv install

# 5. Activate pipenv
$ pipenv shell

# 6. Confirm your python version
(dbtdb) $ python --version

# 7. Confirm your dbt version
(dbtdbt) $ dbt --version

```

### 2. Create a new dbt project

```
# 1. From the virtual env, run
$ dbt init my_dbt_demo

# 2. Fill out your databricks credentials as asked

# 3. cd into your project and test connection
$ cd my_dbt_demo
$ dbt debug

# 4. Create tables
dbt run

# You should nowgitg see two tables in the `appschema` directory in your Databricks cluster.

```
