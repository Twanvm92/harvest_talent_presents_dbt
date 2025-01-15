# Testing dbt project: `jaffle_shop`

`jaffle_shop` is a fictional ecommerce store. This dbt project transforms raw data from an app database into a customers and orders model ready for analytics.


<summary>

## What's in this repo?

</summary>

This repo contains [seeds](https://docs.getdbt.com/docs/building-a-dbt-project/seeds) that includes some (fake) raw data from a fictional app along with some basic dbt [models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models), tests, and docs for this data.

The raw data consists of customers, orders, and payments, with the following entity-relationship diagram:

![Jaffle Shop ERD](/etc/jaffle_shop_erd.png)

## Running this project
Prerequisities: Python >= 3.5 (tested with python 3.11 and 3.12 on Mac and Windows!)

<details open>
<summary>POSIX bash/zsh</summary>

```shell
git clone https://github.com/Twanvm92/harvest_talent_presents_dbt.git
cd harvest_talent_presents_dbt
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate
dbt build --exclude orders
dbt docs generate
dbt docs serve
```
</details>

<details>
<summary>POSIX fish</summary>

```shell
git clone https://github.com/Twanvm92/harvest_talent_presents_dbt.git
cd harvest_talent_presents_dbt
python3 -m venv venv
source venv/bin/activate.fish
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate.fish
dbt build --exclude orders
dbt docs generate
dbt docs serve
```
</details>

<details>
<summary>POSIX csh/tcsh</summary>

```shell
git clone https://github.com/Twanvm92/harvest_talent_presents_dbt.git
cd harvest_talent_presents_dbt
python3 -m venv venv
source venv/bin/activate.csh
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate.csh
dbt build --exclude orders
dbt docs generate
dbt docs serve
```
</details>

<details>
<summary>POSIX PowerShell Core</summary>

```shell
git clone https://github.com/Twanvm92/harvest_talent_presents_dbt.git
cd harvest_talent_presents_dbt
python3 -m venv venv
venv/bin/Activate.ps1
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
venv/bin/Activate.ps1
dbt build --exclude orders
dbt docs generate
dbt docs serve
```
</details>

<details>
<summary>Windows cmd.exe</summary>

```shell
git clone https://github.com/Twanvm92/harvest_talent_presents_dbt.git
cd harvest_talent_presents_dbt
python -m venv venv
venv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
venv\Scripts\activate.bat
dbt build --exclude orders
dbt docs generate
dbt docs serve
```
</details>

<details>
<summary>Windows PowerShell</summary>

```shell
git clone https://github.com/Twanvm92/harvest_talent_presents_dbt.git
cd harvest_talent_presents_dbt
python -m venv venv
venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
venv\Scripts\Activate.ps1
dbt build --exclude orders
dbt docs generate
dbt docs serve
```
</details>

<details>
<summary>GitHub Codespaces / Dev Containers </summary>

#### Steps

1. Ensure you have [Codespaces](https://github.com/features/codespaces) enabled for your GitHub organization or turned on as a beta feature if you're an individual user
2. Click the green **Code** button on near the top right of the page of this repo's homepage (you may already be on it)
3. Instead of cloning the repo like you normally would, instead select the **Codespaces** tab of the pop out, then "Create codespace on `duckdb`"
   ![dbt_full_deploy_commands](images/open_in_codespaces.png)
4. Wait for codespace to boot (~1 min?)
5. Decide whether you'd like to use the Web IDE or open the codespace in your local environment
6. When the codespace opens, a Task pane will show up and call `dbt build` just to show you how it's done
7. Decide whether or not you'd like the recommended extensions installed (like **dbt Power User extension**)
8. Open up a new terminal and type:
    ```
    dbt build
    ```
9. Explore some of the bells and whistles (see below)

If you don't have Codespaces or would like to just run the environment in a local Docker container, you can by:
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
2. Install the VSCode [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension (formerly known as the "Remote - Containers" extension). Video tutorial [here](https://learn.microsoft.com/en-us/shows/beginners-series-to-dev-containers/installing-the-remote-containers-extension-2-of-8--beginners-series-to-dev-containers).
2. Clone this repo and open it in VSCode
1. First time: View > Command Palette > Remote-Containers: Open Folder in Container
    - Wait for container to build -- expected to take several minutes
    - Open a new terminal
3. Subsequent times: Click **Reopen in Container** and wait for container to spin up
   ![Reopen in Container](https://user-images.githubusercontent.com/8158673/181360469-c6f3eb94-6b65-4a8f-93a0-3438d182ee66.png)
1. Continue on step 7 above


#### bells and whistles

There's some bells and whistles defined in the [.devcontainer.json]().devcontainer.json) that are worth calling out. Also a great reference is the [Setting up VSCode for dbt](https://dbt-msft.github.io/dbt-msft-docs/docs/guides/vscode_setup/) guide.

1. there is syntax highlighting provided by the `vdcode-dbt` extension. However, it is configured such that files in your `target/run` and `target/compiled` folder are not syntax highlighted, as a reminder that these files are not where you should be making changes!
2. basic `sqlfluff` linting is enabled as you type. Syntax errors will be underlined in red at the error, and will also be surfaced in the **Problems** tab of the Terminal pane. It's configured to lint as you type.
3. Autocompletion is enabled for generic dbt macros via the `vdcode-dbt` extension. For example, if you type `macro` you'll notice a pop up that you can select with the arrow keys then click tab to get a macro snippet.
  ![image](https://user-images.githubusercontent.com/8158673/181362230-2c00d666-6131-4619-93aa-2e30d9c2bfea.png)
  ![image](https://user-images.githubusercontent.com/8158673/181362274-fa7d71ff-07fc-4b4a-97c3-a0464fbe4c7d.png)
4. the `find-related` extension allows an easy shortcut to navigating using `CMD`+`R`to jump from
    - a model file to it's corresponding compiled version,
    - from a compiled file to either the original model file or the version in `target/run`
5. The `vscode-yaml` YAML, combined with the JSON schema defined in [dbt-labs/dbt-jsonschema](https://github.com/dbt-labs/dbt-jsonschema), autocomplete options while working with dbt's YAML files: i.e. :
    - Project definition files (`dbt_project.yml`)
    - Package files (`packages.yml`)
    - Selectors files (`selectors.yml`)
    - Property files (`models/whatever.yml`)



</details>

### Step-by-step explanation

To get up and running with this project:

1. Clone this repository.

1. Change into the `jaffle_shop_duck` directory from the command line:
    ```shell
    cd harvest_talent_presents_dbt
    ```

1. Install dbt and DuckDB in a virtual environment.

    Expand your shell below:

    <details open>
    <summary>POSIX bash/zsh</summary>

    ```shell
    python3 -m venv venv
    source venv/bin/activate
    python3 -m pip install --upgrade pip
    python3 -m pip install -r requirements.txt
    source venv/bin/activate
    ```
    </details>

    <details>
    <summary>POSIX fish</summary>

    ```shell
    python3 -m venv venv
    source venv/bin/activate.fish
    python3 -m pip install --upgrade pip
    python3 -m pip install -r requirements.txt
    source venv/bin/activate.fish
    ```
    </details>

    <details>
    <summary>POSIX csh/tcsh</summary>

    ```shell
    python3 -m venv venv
    source venv/bin/activate.csh
    python3 -m pip install --upgrade pip
    python3 -m pip install -r requirements.txt
    source venv/bin/activate.csh
    ```
    </details>

    <details>
    <summary>POSIX PowerShell Core</summary>

    ```shell
    python3 -m venv venv
    venv/bin/Activate.ps1
    python3 -m pip install --upgrade pip
    python3 -m pip install -r requirements.txt
    venv/bin/Activate.ps1
    ```
    </details>

    <details>
    <summary>Windows cmd.exe</summary>

    ```shell
    python -m venv venv
    venv\Scripts\activate.bat
    python -m pip install --upgrade pip
    python -m pip install -r requirements.txt
    venv\Scripts\activate.bat
    ```
    </details>

    <details>
    <summary>Windows PowerShell</summary>

    ```shell
    python -m venv venv
    venv\Scripts\Activate.ps1
    python -m pip install --upgrade pip
    python -m pip install -r requirements.txt
    venv\Scripts\Activate.ps1
    ```
    </details>


  
    *Why a 2nd activation of the virtual environment?*
    <details>
    <summary>This may not be necessary for many users, but might be for some. Read on for a first-person report from @dbeatty10.</summary>

    I use `zsh` as my shell on my MacBook Pro, and I use `pyenv` to manage my Python environments. I already had an alpha version of dbt Core 1.2 installed (and yet another via [pipx](https://pypa.github.io/pipx/installation/)):
    ```shell
    $ which dbt
    /Users/dbeatty/.pyenv/shims/dbt
    ```
    ```shell
    $ dbt --version
    Core:
      - installed: 1.2.0-a1
      - latest:    1.1.1    - Ahead of latest version!

    Plugins:
      - bigquery:  1.2.0a1 - Ahead of latest version!
      - snowflake: 1.2.0a1 - Ahead of latest version!
      - redshift:  1.2.0a1 - Ahead of latest version!
      - postgres:  1.2.0a1 - Ahead of latest version!
    ```

    Then I ran all the steps to create a virtual environment and install the requirements of our DuckDB-based Jaffle Shop repo:
    ```shell
    $ python3 -m venv venv
    $ source venv/bin/activate
    (venv) $ python3 -m pip install --upgrade pip
    (venv) $ python3 -m pip install -r requirements.txt
    ```

    Let's examine where `dbt` is installed and which version it is reporting:
    ```shell
    (venv) $ which dbt
    /Users/dbeatty/projects/jaffle_duck/venv/bin/dbt
    ```

    ```shell
    (venv) $ dbt --version
    Core:
      - installed: 1.2.0-a1
      - latest:    1.1.1    - Ahead of latest version!

    Plugins:
      - bigquery:  1.2.0a1 - Ahead of latest version!
      - snowflake: 1.2.0a1 - Ahead of latest version!
      - redshift:  1.2.0a1 - Ahead of latest version!
      - postgres:  1.2.0a1 - Ahead of latest version!
    ```

    ❌ That isn't what we expected -- something isn't right. 😢

    So let's reactivate the virtual environment and try again...
    ```shell
    (venv) $ source venv/bin/activate
    ```

    ```shell
    (venv) $ dbt --version
    Core:
      - installed: 1.1.1
      - latest:    1.1.1 - Up to date!

    Plugins:
      - postgres: 1.1.1 - Up to date!
      - duckdb:   1.1.3 - Up to date!
    ```

    ✅ This is what we want -- the 2nd reactivation worked. 😎 
    </details>

1. Ensure your [profile](https://docs.getdbt.com/reference/profiles.yml) is setup correctly from the command line:
    ```shell
    dbt --version
    dbt debug
    ```

1. Load the CSVs with the demo data set, run the models, and test the output of the models using the [dbt build](https://docs.getdbt.com/reference/commands/build) command:
    ```shell
    dbt build --exclude orders
    ```

1. Query the data:

    Launch a DuckDB command-line interface (CLI):
    ```shell
    duckcli jaffle_shop.duckdb
    ```

    Run a query at the prompt and exit:
    ```
    select * from stg_customers where customer_id = 42;
    exit;
    ```

1. Generate and view the documentation for the project:
    ```shell
    dbt docs generate
    dbt docs serve
    ```

## Running `build` steps independently

1. Load the CSVs with the demo data set. This materializes the CSVs as tables in your target schema. Note that a typical dbt project **does not require this step** since dbt assumes your raw data is already in your warehouse.
    ```shell
    dbt seed
    ```

1. Run the models:
    ```shell
    dbt run --exclude orders
    ```

1. Test the output of the models using the [test](https://docs.getdbt.com/reference/commands/test) command:
    ```shell
    dbt test
    ```

