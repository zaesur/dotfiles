import Bar from "./widgets/bar.js";

App.config({
  style: "./style.css",
  windows: [
    Bar(),
  ],
});

Utils.monitorFile(
  `${App.configDir}`,
  () => App.applyCss(`${App.configDir}/style.css`)
);

export {};
