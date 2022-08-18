# Changelog
Notable changes to project will be documented here

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- functionality for other browsers baked in
- a better solution for scraping favicons

## [1.0.1] - 2022-08-17
### Fixed
- fixe a bug that would break the script if app names with spaces were used
## [1.1.0] - 2022-08-18
- fixed an issue where steam would not execute a desktop app if the exec line had spaces. Deck App Maker now generates a bash script that executes the game and the .desktop file points to that.
- fixed some typos in the desktop file generation
- looped script instead of calling itself, will prevent loop from breaking when new version saved
