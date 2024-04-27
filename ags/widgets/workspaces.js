const hyprland = await Service.import("hyprland");

export default function Workspaces() {
  const activeId = hyprland.active.workspace.bind("id");

  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws
      .map(({ id }) => id)
      .sort()
      .map((id) =>
        Widget.Button({
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
          child: Widget.Label(`${id}`),
          class_name: activeId.as((i) => `${i === id ? "focused" : ""}`),
        }),
      ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
}
