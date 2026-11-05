Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# dbt_scooters

dbt-проект для трансформации данных сервиса аренды электросамокатов. Сырые данные преобразуются в слои staging и marts для аналитики. Первичное описание при учебном проекте.

## Требования

- Python 3.10+
- [uv](https://docs.astral.sh/uv/)
- Доступ к хранилищу данных (профиль в `~/.dbt/profiles.yml`)

## Установка

```bash
uv sync
```

## Настройка подключения

Параметры подключения хранятся в `profiles.yml` (профиль задан локальный). Проверить подключение:

```bash
uv run dbt debug
```

## Основные команды

| Команда | Что делает |
|---|---|
| `uv run dbt deps` | Устанавливает пакеты из `packages.yml` |
| `uv run dbt debug` | Проверяет конфигурацию и подключение |
| `uv run dbt compile` | Компилирует модели в SQL без выполнения |
| `uv run dbt run` | Запускает все модели |
| `uv run dbt run -s model_name` | Запускает одну модель |
| `uv run dbt run -s model_name+` | Модель и все зависимые от неё |
| `uv run dbt test` | Запускает тесты |
| `uv run dbt build` | Модели, тесты, seeds и snapshots в порядке зависимостей |
| `uv run dbt seed` | Загружает CSV из `seeds/` |
| `uv run dbt docs generate` | Генерирует документацию |
| `uv run dbt docs serve` | Открывает документацию локально |
| `uv run dbt clean` | Удаляет `target/` и `dbt_packages/` |

## Структура проекта

```text
dbt_scooters/
├── models/      # SQL-модели
├── seeds/       # статические CSV
├── macros/      # макросы
├── tests/       # кастомные тесты
├── snapshots/   # директория для хранения инструкций к снэпшотам
├── analyses/    # наброски ручных скриптов
├── dbt_project.yml
└── pyproject.toml
```