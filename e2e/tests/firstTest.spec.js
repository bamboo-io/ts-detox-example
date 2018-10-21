describe("Example", () => {
  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it("should have welcome screen", async () => {
    await expect(element(by.id("welcome"))).toBeVisible();
  });

  it("should show hello screen after tap", async () => {
    await element(by.id("button")).tap();
    await expect(element(by.text("Hello World!"))).toBeVisible();
  });

  it("should reverse text in text input", async () => {
    await element(by.id("textInput")).tap();
    await element(by.id("textInput")).typeText("abcdefghijklmnopqrstuvwxyz");
    await expect(element(by.id("reversedText"))).toHaveText(
      "zyxwvutsrqponmlkjihgfedcba"
    );
  });
});
