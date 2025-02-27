{...}: {
  home.file = {
    ".local/share/thumbnailers/audiothumbs.thumbnailer".text = ''
      [Thumbnailer Entry]
      TryExec=ffmpeg
      Exec=ffmpeg -y -i %i %o -fs %s
      MimeType=audio/mpeg;audio/flac;audio/wavpack;audio/webm;audio/mp4;audio/aac;audio/x-matroska;audio/x-opus+ogg    '';
  };
}
