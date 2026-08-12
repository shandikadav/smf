import 'package:mason/mason.dart';

final featureBundle = MasonBundle.fromJson(
{
  "files": [
    {
      "path": "{{feature_name}}/data/models/.gitkeep",
      "data": "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRhdGEgbW9kZWxzLgo=",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/data/repositories/.gitkeep",
      "data": "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRhdGEgcmVwb3NpdG9yaWVzLgo=",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/domain/entities/.gitkeep",
      "data": "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRvbWFpbiBlbnRpdGllcy4K",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/domain/usecases/.gitkeep",
      "data": "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIGRvbWFpbiB1c2VjYXNlcy4K",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/presentation/bloc/{{feature_name}}_bloc.dart",
      "data": "e3sjdXNlX2Jsb2N9fWltcG9ydCAncGFja2FnZTpmbHV0dGVyX2Jsb2MvZmx1dHRlcl9ibG9jLmRhcnQnOwoKaW1wb3J0ICd7e2ZlYXR1cmVfbmFtZX19X2V2ZW50LmRhcnQnOwppbXBvcnQgJ3t7ZmVhdHVyZV9uYW1lfX1fc3RhdGUuZGFydCc7CgpjbGFzcyB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUJsb2MKICAgIGV4dGVuZHMgQmxvYzx7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUV2ZW50LCB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlPiB7CiAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1CbG9jKCkgOiBzdXBlcihjb25zdCB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKCkpIHsKICAgIG9uPHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhcnRlZD4oX29uU3RhcnRlZCk7CiAgfQoKICBGdXR1cmU8dm9pZD4gX29uU3RhcnRlZCgKICAgIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhcnRlZCBldmVudCwKICAgIEVtaXR0ZXI8e3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT4gZW1pdCwKICApIGFzeW5jIHsKICAgIGVtaXQoc3RhdGUuY29weVdpdGgoc3RhdHVzOiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cy5sb2FkaW5nKSk7CiAgICB0cnkgewogICAgICAvLyBUT0RPOiBJbXBsZW1lbnQgZmVhdHVyZSBsb2dpYwogICAgICBlbWl0KHN0YXRlLmNvcHlXaXRoKHN0YXR1czoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0dXMuc3VjY2VzcykpOwogICAgfSBjYXRjaCAoXykgewogICAgICBlbWl0KHN0YXRlLmNvcHlXaXRoKHN0YXR1czoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0dXMuZmFpbHVyZSkpOwogICAgfQogIH0KfQp7ey91c2VfYmxvY319Cg==",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/presentation/bloc/{{feature_name}}_event.dart",
      "data": "e3sjdXNlX2Jsb2N9fWltcG9ydCAncGFja2FnZTplcXVhdGFibGUvZXF1YXRhYmxlLmRhcnQnOwoKYWJzdHJhY3QgY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCBleHRlbmRzIEVxdWF0YWJsZSB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCgpOwoKICBAb3ZlcnJpZGUKICBMaXN0PE9iamVjdD8+IGdldCBwcm9wcyA9PiBbXTsKfQoKY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGFydGVkIGV4dGVuZHMge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGFydGVkKCk7Cn0Ke3svdXNlX2Jsb2N9fQo=",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/presentation/bloc/{{feature_name}}_state.dart",
      "data": "e3sjdXNlX2Jsb2N9fWltcG9ydCAncGFja2FnZTplcXVhdGFibGUvZXF1YXRhYmxlLmRhcnQnOwoKZW51bSB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cyB7IGluaXRpYWwsIGxvYWRpbmcsIHN1Y2Nlc3MsIGZhaWx1cmUgfQoKY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSBleHRlbmRzIEVxdWF0YWJsZSB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSh7CiAgICB0aGlzLnN0YXR1cyA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzLmluaXRpYWwsCiAgfSk7CgogIGZpbmFsIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzIHN0YXR1czsKCiAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSBjb3B5V2l0aCh7CiAgICB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cz8gc3RhdHVzLAogIH0pIHsKICAgIHJldHVybiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKAogICAgICBzdGF0dXM6IHN0YXR1cyA/PyB0aGlzLnN0YXR1cywKICAgICk7CiAgfQoKICBAb3ZlcnJpZGUKICBMaXN0PE9iamVjdD8+IGdldCBwcm9wcyA9PiBbc3RhdHVzXTsKfQp7ey91c2VfYmxvY319Cg==",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/presentation/pages/{{feature_name}}_page.dart",
      "data": "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CgpjbGFzcyB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVBhZ2UgZXh0ZW5kcyBTdGF0ZWxlc3NXaWRnZXQgewogIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19UGFnZSh7c3VwZXIua2V5fSk7CgogIEBvdmVycmlkZQogIFdpZGdldCBidWlsZChCdWlsZENvbnRleHQgY29udGV4dCkgewogICAgcmV0dXJuIFNjYWZmb2xkKAogICAgICBhcHBCYXI6IEFwcEJhcigKICAgICAgICB0aXRsZTogY29uc3QgVGV4dCgne3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fScpLAogICAgICApLAogICAgICBib2R5OiBjb25zdCBDZW50ZXIoCiAgICAgICAgY2hpbGQ6IFRleHQoJ3t7ZmVhdHVyZV9uYW1lLnRpdGxlQ2FzZSgpfX0gUGFnZScpLAogICAgICApLAogICAgKTsKICB9Cn0K",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/presentation/providers/{{feature_name}}_provider.dart",
      "data": "e3sjdXNlX3JpdmVycG9kfX1pbXBvcnQgJ3BhY2thZ2U6Zmx1dHRlcl9yaXZlcnBvZC9mbHV0dGVyX3JpdmVycG9kLmRhcnQnOwoKZW51bSB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cyB7IGluaXRpYWwsIGxvYWRpbmcsIHN1Y2Nlc3MsIGZhaWx1cmUgfQoKY2xhc3Mge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSB7CiAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSh7CiAgICB0aGlzLnN0YXR1cyA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzLmluaXRpYWwsCiAgfSk7CgogIGZpbmFsIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdHVzIHN0YXR1czsKCiAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSBjb3B5V2l0aCh7CiAgICB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cz8gc3RhdHVzLAogIH0pIHsKICAgIHJldHVybiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKAogICAgICBzdGF0dXM6IHN0YXR1cyA/PyB0aGlzLnN0YXR1cywKICAgICk7CiAgfQp9CgpjbGFzcyB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fU5vdGlmaWVyIGV4dGVuZHMgU3RhdGVOb3RpZmllcjx7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlPiB7CiAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1Ob3RpZmllcigpIDogc3VwZXIoY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSgpKTsKCiAgRnV0dXJlPHZvaWQ+IGxvYWQoKSBhc3luYyB7CiAgICBzdGF0ZSA9IHN0YXRlLmNvcHlXaXRoKHN0YXR1czoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0dXMubG9hZGluZyk7CiAgICB0cnkgewogICAgICAvLyBUT0RPOiBJbXBsZW1lbnQgZmVhdHVyZSBsb2dpYwogICAgICBzdGF0ZSA9IHN0YXRlLmNvcHlXaXRoKHN0YXR1czoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0dXMuc3VjY2Vzcyk7CiAgICB9IGNhdGNoIChfKSB7CiAgICAgIHN0YXRlID0gc3RhdGUuY29weVdpdGgoc3RhdHVzOiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXR1cy5mYWlsdXJlKTsKICAgIH0KICB9Cn0KCmZpbmFsIHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1Qcm92aWRlciA9CiAgICBTdGF0ZU5vdGlmaWVyUHJvdmlkZXI8e3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1Ob3RpZmllciwge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT4oCiAgKHJlZikgPT4ge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1Ob3RpZmllcigpLAopOwp7ey91c2Vfcml2ZXJwb2R9fQo=",
      "type": "text"
    },
    {
      "path": "{{feature_name}}/presentation/widgets/.gitkeep",
      "data": "Ly8ge3tmZWF0dXJlX25hbWUudGl0bGVDYXNlKCl9fSBmZWF0dXJlIHdpZGdldHMuCg==",
      "type": "text"
    }
  ],
  "hooks": [],
  "name": "feature",
  "description": "Generates a single Feature-First feature folder structure.",
  "version": "0.1.0",
  "environment": {
    "mason": "any"
  },
  "vars": {
    "feature_name": {
      "type": "string",
      "description": "The feature name in snake_case."
    },
    "use_bloc": {
      "type": "boolean",
      "description": "Whether to use BLoC state management.",
      "default": true
    },
    "use_riverpod": {
      "type": "boolean",
      "description": "Whether to use Riverpod state management.",
      "default": false
    }
  }
}
);
