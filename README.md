# TypeScript + React-Native + Jest + Detox Example Project

This is an example React-Native project that incorporates:

- [TypeScript](https://www.typescriptlang.org/)
  - Can be used for source code, unit tests, and end-to-end tests
- [Jest](https://jestjs.io) to run both your unit and end-to-end tests
  - Uses [`ts-jest`](https://github.com/kulshekhar/ts-jest) to allow Jest to understand your TS files
- [Detox](https://github.com/wix/detox)
  - Configured to support iOS _and_ Android

This project uses [emin93's react-native-template-typescript](https://github.com/emin93/react-native-template-typescript) as a bootstrap.

The main goal of this project is to demonstrate how to incorporate Detox into a pre-existing TS/RN/Jest project, but you can use it as a starter template as well.

## React Native CLI template

You can create a project similar to this one using the React Native CLI and [`react-native-template-ts-detox-jest`](https://github.com/solkaz/react-native-template-ts-detox-jest)

## FAQ

### Adding support for `baseUrl`/`paths`

If you want to use TypeScript's `baseUrl` and `paths` options, you'll need to configure

- Babel (for development) - Babel won't natively transform your module paths like TypeScript would, so you'll need to provide a plugin that will mimic that behavior.
  - Add [`babel-plugin-module-resolver`](https://github.com/tleunen/babel-plugin-module-resolver) to your project dependencies:
  ```sh
  npm install -D babel-plugin-module-resolver
  # yarn: yarn add -D babel-plugin-module-resolver
  ```
  - In `babel.config.js`, add the following:
  ```js
  // ...
  "plugins": [
      [
          "module-resolver",
          {
              "root": [ /* Put your `baseUrl` here */ ],
              "alias": {
                  // Put your `paths` setup here
              }
          }
      ]
  ]
  // ...
  ```
- `ts-jest` - Refer to [this section](https://kulshekhar.github.io/ts-jest/user/config/#paths-mapping) in the `ts-jest` docs.
- When running iOS, you may encounter "Multiple commands produce ..." if you're using XCode 10. This is usually fixed by forcing XCode to [use the legacy build system](https://stackoverflow.com/a/53131590/2312400)

## TODO

- [ ] Write documentation on setting this up from scratch
- [x] ~~Create a script/tool to automate creating projects with this structure~~

## Contributing

Issues and PRs are welcome!

Please note that this project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## License

[MIT](./LICENSE)
