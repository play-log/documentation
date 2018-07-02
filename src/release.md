# How to release a new version

1. Ensure development requirements.
1. Run tests.
1. Update documentation, README and other stuff (if required).
1. Update CHANGELOG (`src/changelog.md` in a documentation repository).
1. Update TODO (`src/todo.md` in a documetation repository)
1. Run `bin/build production <version>`, where `<version>` is a target version.
1. Push the image to docker hub `docker push rossnomann/playlog:<version>`.
1. Make a release on GitHub.
