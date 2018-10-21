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

I plan on writing an article detailing how to integrate Detox into your TS/RN project, but for now, I would recommend looking at the commit history as I've detailed the steps taken in each commit's description

## FAQ

### Adding support for `baseUrl`/`paths`

If you want to use TypeScript's `baseUrl` and `paths` options, you'll need to configure

- Babel (for development) - Babel won't natively transform your module paths like TypeScript would, so you'll need to provide a plugin that will mimic that behavior.
  - Add `babel-plugin-module-resolver` to your project dependencies
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

## Contributing

Issues and PRs are welcome!

Please note that this project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## License

[MIT](./LICENSE)
