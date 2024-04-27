import Workspaces from "./workspaces.js";
import Volume from "./volume.js";

const hyprland = await Service.import("hyprland");

const date = Variable("", {
  poll: [1000, 'date "+%H:%M:%S %b %e"'],
});

function ClientTitle() {
  return Widget.Label({
    class_name: "client-title",
    label: hyprland.active.client.bind("title"),
  });
}

function Clock() {
  return Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });
}

function Left() {
  return Widget.Box({
    spacing: 8,
    class_name: "left",
    children: [ClientTitle()],
  });
}

function Center() {
  return Widget.Box({
    spacing: 8,
    class_name: "center",
    children: [Workspaces()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    class_name: "right",
    children: [Volume(), Clock()],
  });
}

export default function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
}
