// This _must_ be renamed because the typings for Detox declare `detox` as a global const
const detox_ = require("detox");
const config = require("../package.json").detox;
const adapter = require("detox/runners/jest/adapter");

jest.setTimeout(120000);
jasmine.getEnv().addReporter(adapter);

beforeAll(async () => {
  await detox_.init(config);
});

beforeEach(async () => {
  await adapter.beforeEach();
});

afterAll(async () => {
  await adapter.afterAll();
  await detox_.cleanup();
});
