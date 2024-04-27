const audio = await Service.import("audio");

function getIcon() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  const icon = audio.speaker.is_muted
    ? 0
    : [101, 67, 34, 1, 0].find(
      (threshold) => threshold <= audio.speaker.volume * 100,
    );

  return `audio-volume-${icons[icon]}-symbolic`;
}

export default function Volume() {
  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.speaker, getIcon),
  });

  const slider = Widget.Slider({
    hexpand: true,
    draw_value: false,
    on_change: ({ value }) => (audio.speaker.volume = value),
    setup: (self) =>
      self.hook(audio.speaker, () => {
        self.value = audio.speaker.volume || 0;
      }),
  });

  return Widget.Box({
    class_name: "volume",
    css: "min-width: 180px",
    children: [icon, slider],
  });
}
