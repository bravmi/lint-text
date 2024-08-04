# lint-text-action

This is a repository for the lint-text-action, a GitHub Action that performs linting on text files.

## Usage

To use this action, follow these steps:

1. Create a workflow file (e.g., `.github/workflows/lint.yml`) in your repository.
2. Add the following code to the workflow file:

```yaml
name: Lint Text Files

on: [pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Lint text action
        id: lint
        uses: bravmi/lint-text-action@master
        with:
          tool: 'proselint'  # Change to 'write-good' if preferred
          ignore_paths: "zsh"
```

3. Commit and push the workflow file to your repository.

Now, whenever you push or create a pull request, the lint-text-action will automatically run and perform linting on your text files.

## Configuration

To configure the lint-text-action, you can modify the `lint.yml` workflow file. Within the `lint` job, you can customize the following options:

- `tool`: Specify the linting tool to use. You can choose between 'proselint' and 'write-good'.
- `ignore_paths`: Specify paths as as string to ignore during linting.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
