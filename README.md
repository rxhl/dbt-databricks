## dbt with Databricks

In this tutorial, we will create transformations using dbt for data stored in Databricks.
Read the full article [here](https://rxhl.notion.site/dbt-vs-Delta-Live-Tables-42e732a8c4ba450595897eb73832ce95).

![Tables](/assets/zones.png)

### 0. Prereqs

Make sure you have a Databricks account and a cluster up and running.

### 1. Local dbt setup

```
# 1. Clone the repo

# 2. Install Pipenv
$ pip3 install -u pipenv

# 3. Update the python version in the Pipfile per your system and run
$ pipenv --python <YOUR_LOCAL_PYTHON_VERSION>

# 4. Install deps
$ pipenv install

# 5. Activate pipenv
$ pipenv shell

# 6. Confirm your python version
(dbt-databricks) $ python --version

# 7. Confirm your dbt version
(dbt-databricks) $ dbt --version
```

### 2. Prepare seed data in Databricks

To create some real transformations, we need to provide seed (raw) data to dbt.
We'll manually create a few raw tables in Databricks using scripts available in the `databricks_scripts` directory.
You can run these scripts directly on a Databricks notebook that is attached to an active cluster.

### 3. Create dbt models

Once the seed data has been created in Databricks, we can start creating some dbt models -- `zzz_game_details.sql` and `zzz_win_loss_records.sql`.
You can then execute these models by,

```
# 1. cd into the dbt project
(dbt-databricks) $ cd my_dbt_demo

# 2. Run the models
(dbt-databricks) $ dbt run --model models/zzz_game_details.sql models/zzz_win_loss_records.sql
```

This would create two new tables in your Databricks cluster.

### 4. Generate dbt docs

```
(dbt-databricks) $ dbt docs generate
(dbt-databricks) $ dbt docs serve

# This would open a tab on localhost:8080 where you can view the autogenerated docs.
```

### 5. Test models

```
(dbt-databricks) $ dbt test
```

### (optional) Create a new dbt project from scratch

```
# 1. From the virtual env, run
$ dbt init my_new_dbt_project

# 2. Fill out your databricks credentials as asked

# 3. cd into your project and test connection
$ cd my_new_dbt_project
$ dbt debug

# 4. Create tables
dbt run
```

## Reference

[dbt with Databricks](https://docs.databricks.com/integrations/prep/dbt.html#requirements)
