import 'package:mason/mason.dart';

final featureBundle = MasonBundle.fromJson({
  "files": [
    {
      "path": "{{feature_name}}/data/models/.gitkeep",
      "data":
          "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRhdGEgbW9kZWxzLgo=",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/data/repositories/.gitkeep",
      "data":
          "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRhdGEgcmVwb3NpdG9yaWVzLgo=",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/domain/entities/.gitkeep",
      "data":
          "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRvbWFpbiBlbnRpdGllcy4K",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/domain/usecases/.gitkeep",
      "data":
          "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRvbWFpbiB1c2VjYXNlcy4K",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/presentation/bloc/{{feature_name}}_bloc.dart",
      "data":
          "e3sjdXNlX2Jsb2N9fWltcG9ydCAncGFja2FnZTpmbHV0dGVyX2Jsb2MvZmx1dHRlcl9ibG9jLmRhcnQnOwoKaW1wb3J0ICd7e2ZlYXR1cmVfbmFtZX19X2V2ZW50LmRhcnQnOwppbXBvcnQgJ3t7ZmVhdHVyZV9uYW1lfX1fc3RhdGUuZGFydCc7CgpjbGFzcyB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUJsb2MKICAgIGV4dGVuZHMgQmxvYzx7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUV2ZW50LCB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlPiB7CiAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1CbG9jKCkgOiBzdXBlcihjb25zdCB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKCkpIHsKICAgIG9uPHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhcnRlZD4oX29uU3RhcnRlZCk7CiAgfQoKICBGdXR1cmU8dm9pZD4gX29uU3RhcnRlZCgKICAgIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhcnRlZCBldmVudCwKICAgIEVtaXR0ZXI8e3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT4gZW1pdCwKICApIGFzeW5jIHsKICAgIGVtaXQoc3RhdGUuY29weVdpdGgoc3RhdHVzOiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cy5sb2FkaW5nKSk7CiAgICB0cnkgewogICAgICAvLyBUT0RPOiBJbXBsZW1lbnQgZmVhdHVyZSBsb2dpYwogICAgICBpZiAoZW1pdC5pc0RvbmUpIHJldHVybjsKICAgICAgZW1pdChzdGF0ZS5jb3B5V2l0aChzdGF0dXM6IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzLnN1Y2Nlc3MpKTsKICAgIH0gY2F0Y2ggKF8pIHsKICAgICAgaWYgKGVtaXQuaXNEb25lKSByZXR1cm47CiAgICAgIGVtaXQoc3RhdGUuY29weVdpdGgoc3RhdHVzOiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cy5mYWlsdXJlKSk7CiAgICB9CiAgfQp9Cnt7L3VzZV9ibG9jfX0K",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/presentation/bloc/{{feature_name}}_event.dart",
      "data":
          "e3sjdXNlX2Jsb2N9fWltcG9ydCAncGFja2FnZTplcXVhdGFibGUvZXF1YXRhYmxlLmRhcnQnOwoKYWJzdHJhY3QgY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCBleHRlbmRzIEVxdWF0YWJsZSB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCgpOwoKICBAb3ZlcnJpZGUKICBMaXN0PE9iamVjdD8+IGdldCBwcm9wcyA9PiBbXTsKfQoKY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGFydGVkIGV4dGVuZHMge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGFydGVkKCk7Cn0Ke3svdXNlX2Jsb2N9fQo=",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/presentation/bloc/{{feature_name}}_state.dart",
      "data":
          "e3sjdXNlX2Jsb2N9fWltcG9ydCAncGFja2FnZTplcXVhdGFibGUvZXF1YXRhYmxlLmRhcnQnOwoKZW51bSB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cyB7IGluaXRpYWwsIGxvYWRpbmcsIHN1Y2Nlc3MsIGZhaWx1cmUgfQoKY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSBleHRlbmRzIEVxdWF0YWJsZSB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSh7CiAgICB0aGlzLnN0YXR1cyA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzLmluaXRpYWwsCiAgfSk7CgogIGZpbmFsIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzIHN0YXR1czsKCiAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSBjb3B5V2l0aCh7CiAgICB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cz8gc3RhdHVzLAogIH0pIHsKICAgIHJldHVybiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKAogICAgICBzdGF0dXM6IHN0YXR1cyA/PyB0aGlzLnN0YXR1cywKICAgICk7CiAgfQoKICBAb3ZlcnJpZGUKICBMaXN0PE9iamVjdD8+IGdldCBwcm9wcyA9PiBbc3RhdHVzXTsKfQp7ey91c2VfYmxvY319Cg==",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/presentation/pages/{{feature_name}}_page.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7Cnt7I3VzZV9ibG9jfX1pbXBvcnQgJ3BhY2thZ2U6Zmx1dHRlcl9ibG9jL2ZsdXR0ZXJfYmxvYy5kYXJ0JzsKCmltcG9ydCAnLi4vYmxvYy97e2ZlYXR1cmVfbmFtZX19X2Jsb2MuZGFydCc7CmltcG9ydCAnLi4vYmxvYy97e2ZlYXR1cmVfbmFtZX19X2V2ZW50LmRhcnQnOwppbXBvcnQgJy4uL2Jsb2Mve3tmZWF0dXJlX25hbWV9fV9zdGF0ZS5kYXJ0Jzt7ey91c2VfYmxvY319Cnt7I3VzZV9yaXZlcnBvZH19aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXJfcml2ZXJwb2QvZmx1dHRlcl9yaXZlcnBvZC5kYXJ0JzsKCmltcG9ydCAnLi4vcHJvdmlkZXJzL3t7ZmVhdHVyZV9uYW1lfX1fcHJvdmlkZXIuZGFydCc7e3svdXNlX3JpdmVycG9kfX0KCmNsYXNzIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19UGFnZSBleHRlbmRzIHt7I3VzZV9yaXZlcnBvZH19Q29uc3VtZXJXaWRnZXR7ey91c2Vfcml2ZXJwb2R9fXt7XnVzZV9yaXZlcnBvZH19U3RhdGVsZXNzV2lkZ2V0e3svdXNlX3JpdmVycG9kfX0gewogIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19UGFnZSh7c3VwZXIua2V5fSk7CgogIEBvdmVycmlkZQogIFdpZGdldCBidWlsZChCdWlsZENvbnRleHQgY29udGV4dHt7I3VzZV9yaXZlcnBvZH19LCBXaWRnZXRSZWYgcmVme3svdXNlX3JpdmVycG9kfX0pIHsKICAgIHt7I3VzZV9ibG9jfX1yZXR1cm4gQmxvY1Byb3ZpZGVyKAogICAgICBjcmVhdGU6IChjb250ZXh0KSA9PiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUJsb2MoKSwKICAgICAgY2hpbGQ6IEJsb2NCdWlsZGVyPHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYywge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT4oCiAgICAgICAgYnVpbGRlcjogKGNvbnRleHQsIHN0YXRlKSA9PiBfe3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1WaWV3KAogICAgICAgICAgc3RhdHVzOiBzdGF0ZS5zdGF0dXMubmFtZSwKICAgICAgICAgIG9uTG9hZDogKCkgPT4gY29udGV4dC5yZWFkPHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYz4oKS5hZGQoY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGFydGVkKCkpLAogICAgICAgICksCiAgICAgICksCiAgICApO3t7L3VzZV9ibG9jfX0KICAgIHt7I3VzZV9yaXZlcnBvZH19ZmluYWwgc3RhdGUgPSByZWYud2F0Y2goe3tmZWF0dXJlX25hbWUuY2FtZWxDYXNlKCl9fVByb3ZpZGVyKTsKICAgIHJldHVybiBfe3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1WaWV3KAogICAgICBzdGF0dXM6IHN0YXRlLnN0YXR1cy5uYW1lLAogICAgICBvbkxvYWQ6ICgpID0+IHJlZi5yZWFkKHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1Qcm92aWRlci5ub3RpZmllcikubG9hZCgpLAogICAgKTt7ey91c2Vfcml2ZXJwb2R9fQogICAge3tedXNlX2Jsb2N9fXt7XnVzZV9yaXZlcnBvZH19cmV0dXJuIGNvbnN0IF97e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVZpZXcoc3RhdHVzOiBudWxsLCBvbkxvYWQ6IG51bGwpO3t7L3VzZV9yaXZlcnBvZH19e3svdXNlX2Jsb2N9fQogIH0KfQoKY2xhc3MgX3t7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19VmlldyBleHRlbmRzIFN0YXRlbGVzc1dpZGdldCB7CiAgY29uc3QgX3t7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Vmlldyh7cmVxdWlyZWQgdGhpcy5zdGF0dXMsIHJlcXVpcmVkIHRoaXMub25Mb2FkfSk7CgogIGZpbmFsIFN0cmluZz8gc3RhdHVzOwogIGZpbmFsIFZvaWRDYWxsYmFjaz8gb25Mb2FkOwoKICBAb3ZlcnJpZGUKICBXaWRnZXQgYnVpbGQoQnVpbGRDb250ZXh0IGNvbnRleHQpIHsKICAgIHJldHVybiBTY2FmZm9sZCgKICAgICAgYXBwQmFyOiBBcHBCYXIoCiAgICAgICAgdGl0bGU6IGNvbnN0IFRleHQoJ3t7ZmVhdHVyZV9uYW1lLnRpdGxlQ2FzZSgpfX0nKSwKICAgICAgKSwKICAgICAgYm9keTogQ2VudGVyKAogICAgICAgIGNoaWxkOiBDb2x1bW4oCiAgICAgICAgICBtYWluQXhpc1NpemU6IE1haW5BeGlzU2l6ZS5taW4sCiAgICAgICAgICBjaGlsZHJlbjogWwogICAgICAgICAgICBjb25zdCBUZXh0KCd7e2ZlYXR1cmVfbmFtZS50aXRsZUNhc2UoKX19IFBhZ2UnKSwKICAgICAgICAgICAgaWYgKHN0YXR1cyAhPSBudWxsKSBUZXh0KCdTdGF0dXM6ICRzdGF0dXMnKSwKICAgICAgICAgICAgaWYgKG9uTG9hZCAhPSBudWxsKQogICAgICAgICAgICAgIEVsZXZhdGVkQnV0dG9uKAogICAgICAgICAgICAgICAgb25QcmVzc2VkOiBzdGF0dXMgPT0gJ2xvYWRpbmcnID8gbnVsbCA6IG9uTG9hZCwKICAgICAgICAgICAgICAgIGNoaWxkOiBjb25zdCBUZXh0KCdMb2FkJyksCiAgICAgICAgICAgICAgKSwKICAgICAgICAgIF0sCiAgICAgICAgKSwKICAgICAgKSwKICAgICk7CiAgfQp9Cg==",
      "type": "text",
    },
    {
      "path":
          "{{feature_name}}/presentation/providers/{{feature_name}}_provider.dart",
      "data":
          "e3sjdXNlX3JpdmVycG9kfX1pbXBvcnQgJ3BhY2thZ2U6Zmx1dHRlcl9yaXZlcnBvZC9mbHV0dGVyX3JpdmVycG9kLmRhcnQnOwoKZW51bSB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cyB7IGluaXRpYWwsIGxvYWRpbmcsIHN1Y2Nlc3MsIGZhaWx1cmUgfQoKY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSh7CiAgICB0aGlzLnN0YXR1cyA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzLmluaXRpYWwsCiAgfSk7CgogIGZpbmFsIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzIHN0YXR1czsKCiAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSBjb3B5V2l0aCh7CiAgICB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cz8gc3RhdHVzLAogIH0pIHsKICAgIHJldHVybiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKAogICAgICBzdGF0dXM6IHN0YXR1cyA/PyB0aGlzLnN0YXR1cywKICAgICk7CiAgfQp9CgpjbGFzcyB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fU5vdGlmaWVyIGV4dGVuZHMgTm90aWZpZXI8e3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT4gewogIGJvb2wgX2Rpc3Bvc2VkID0gZmFsc2U7CgogIEBvdmVycmlkZQogIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUgYnVpbGQoKSB7CiAgICBfZGlzcG9zZWQgPSBmYWxzZTsKICAgIHJlZi5vbkRpc3Bvc2UoKCkgPT4gX2Rpc3Bvc2VkID0gdHJ1ZSk7CiAgICByZXR1cm4gY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSgpOwogIH0KCiAgRnV0dXJlPHZvaWQ+IGxvYWQoKSBhc3luYyB7CiAgICBpZiAoX2Rpc3Bvc2VkKSByZXR1cm47CiAgICBzdGF0ZSA9IHN0YXRlLmNvcHlXaXRoKHN0YXR1czoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0dXMubG9hZGluZyk7CiAgICB0cnkgewogICAgICAvLyBUT0RPOiBJbXBsZW1lbnQgZmVhdHVyZSBsb2dpYwogICAgICBpZiAoX2Rpc3Bvc2VkKSByZXR1cm47CiAgICAgIHN0YXRlID0gc3RhdGUuY29weVdpdGgoc3RhdHVzOiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cy5zdWNjZXNzKTsKICAgIH0gY2F0Y2ggKF8pIHsKICAgICAgaWYgKF9kaXNwb3NlZCkgcmV0dXJuOwogICAgICBzdGF0ZSA9IHN0YXRlLmNvcHlXaXRoKHN0YXR1czoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0dXMuZmFpbHVyZSk7CiAgICB9CiAgfQp9CgpmaW5hbCB7e2ZlYXR1cmVfbmFtZS5jYW1lbENhc2UoKX19UHJvdmlkZXIgPQogICAgTm90aWZpZXJQcm92aWRlcjx7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fU5vdGlmaWVyLCB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlPigKICB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fU5vdGlmaWVyLm5ldywKKTsKe3svdXNlX3JpdmVycG9kfX0K",
      "type": "text",
    },
    {
      "path": "{{feature_name}}/presentation/widgets/.gitkeep",
      "data":
          "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIHdpZGdldHMuCg==",
      "type": "text",
    },
  ],
  "hooks": [],
  "name": "feature",
  "description": "Generates a single Feature-First feature folder structure.",
  "version": "0.1.0",
  "environment": {"mason": "any"},
  "vars": {
    "feature_name": {
      "type": "string",
      "description": "The feature name in snake_case.",
    },
    "use_bloc": {
      "type": "boolean",
      "description": "Whether to use BLoC state management.",
      "default": true,
    },
    "use_riverpod": {
      "type": "boolean",
      "description": "Whether to use Riverpod state management.",
      "default": false,
    },
  },
});
