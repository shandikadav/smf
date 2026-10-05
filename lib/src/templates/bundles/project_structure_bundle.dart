import 'package:mason/mason.dart';

final projectStructureBundle = MasonBundle.fromJson({
  "files": [
    {
      "path": "lib/app/app.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7Cnt7I3VzZV9yaXZlcnBvZH19aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXJfcml2ZXJwb2QvZmx1dHRlcl9yaXZlcnBvZC5kYXJ0Jzt7ey91c2Vfcml2ZXJwb2R9fQppbXBvcnQgJy4uL2NvcmUvdGhlbWUvYXBwX3RoZW1lLmRhcnQnOwppbXBvcnQgJ3JvdXRlci9hcHBfcm91dGVyLmRhcnQnOwoKY2xhc3MgQXBwIGV4dGVuZHMgU3RhdGVsZXNzV2lkZ2V0IHsKICBjb25zdCBBcHAoe3N1cGVyLmtleX0pOwoKICBAb3ZlcnJpZGUKICBXaWRnZXQgYnVpbGQoQnVpbGRDb250ZXh0IGNvbnRleHQpIHsKICAgIGZpbmFsIHJvdXRlciA9IEFwcFJvdXRlci5yb3V0ZXI7CgogICAge3sjdXNlX3JpdmVycG9kfX1yZXR1cm4gUHJvdmlkZXJTY29wZSgKICAgICAgY2hpbGQ6IE1hdGVyaWFsQXBwLnJvdXRlcigKICAgICAgICB0aXRsZTogJ3t7cHJvamVjdF9uYW1lLnRpdGxlQ2FzZSgpfX0nLAogICAgICAgIHRoZW1lOiBBcHBUaGVtZS5saWdodFRoZW1lLAogICAgICAgIGRhcmtUaGVtZTogQXBwVGhlbWUuZGFya1RoZW1lLAogICAgICAgIHJvdXRlckNvbmZpZzogcm91dGVyLAogICAgICApLAogICAgKTt7ey91c2Vfcml2ZXJwb2R9fQogICAge3tedXNlX3JpdmVycG9kfX1yZXR1cm4gTWF0ZXJpYWxBcHAucm91dGVyKAogICAgICB0aXRsZTogJ3t7cHJvamVjdF9uYW1lLnRpdGxlQ2FzZSgpfX0nLAogICAgICB0aGVtZTogQXBwVGhlbWUubGlnaHRUaGVtZSwKICAgICAgZGFya1RoZW1lOiBBcHBUaGVtZS5kYXJrVGhlbWUsCiAgICAgIHJvdXRlckNvbmZpZzogcm91dGVyLAogICAgKTt7ey91c2Vfcml2ZXJwb2R9fQogIH0KfQo=",
      "type": "text",
    },
    {
      "path": "lib/app/router/app_router.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmdvX3JvdXRlci9nb19yb3V0ZXIuZGFydCc7CmltcG9ydCAnLi4vLi4vZmVhdHVyZXMvaG9tZS9wcmVzZW50YXRpb24vcGFnZXMvaG9tZV9wYWdlLmRhcnQnOwoKY2xhc3MgQXBwUm91dGVyIHsKICBBcHBSb3V0ZXIuXygpOwoKICBzdGF0aWMgZmluYWwgcm91dGVyID0gR29Sb3V0ZXIoCiAgICBpbml0aWFsTG9jYXRpb246ICcvJywKICAgIHJvdXRlczogWwogICAgICBHb1JvdXRlKAogICAgICAgIHBhdGg6ICcvJywKICAgICAgICBuYW1lOiAnaG9tZScsCiAgICAgICAgYnVpbGRlcjogKGNvbnRleHQsIHN0YXRlKSA9PiBjb25zdCBIb21lUGFnZSgpLAogICAgICApLAogICAgXSwKICApOwp9Cg==",
      "type": "text",
    },
    {
      "path": "lib/core/config/env.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmVudmllZC9lbnZpZWQuZGFydCc7CgpwYXJ0ICdlbnYuZy5kYXJ0JzsKCnt7I2lzX3ByZXNldF9lbnRlcnByaXNlfX0vLy8gRW52aXJvbm1lbnQgY29uZmlndXJhdGlvbiBsb2FkZWQgYXQgYnVpbGQgdGltZSB2aWEgZW52aWVkLgovLy8KLy8vIENyZWF0ZSBhIGAuZW52YCBmaWxlIGF0IHRoZSBwcm9qZWN0IHJvb3Qgd2l0aCB5b3VyIGtleXM6Ci8vLyBgYGAKLy8vIEJBU0VfVVJMPWh0dHBzOi8vYXBpLmV4YW1wbGUuY29tCi8vLyBBUElfS0VZPXlvdXJfYXBpX2tleV9oZXJlCi8vLyBgYGAKQEVudmllZChwYXRoOiAnLmVudicpCmFic3RyYWN0IGNsYXNzIEVudiB7CiAgQEVudmllZEZpZWxkKHZhck5hbWU6ICdCQVNFX1VSTCcpCiAgc3RhdGljIGNvbnN0IFN0cmluZyBiYXNlVXJsID0gX0Vudi5iYXNlVXJsOwoKICBARW52aWVkRmllbGQodmFyTmFtZTogJ0FQSV9LRVknLCBvYmZ1c2NhdGU6IHRydWUpCiAgc3RhdGljIGZpbmFsIFN0cmluZyBhcGlLZXkgPSBfRW52LmFwaUtleTsKfQp7ey9pc19wcmVzZXRfZW50ZXJwcmlzZX19e3teaXNfcHJlc2V0X2VudGVycHJpc2V9fS8vLyBFbnZpcm9ubWVudCBjb25maWd1cmF0aW9uIGxvYWRlZCBhdCBidWlsZCB0aW1lIHZpYSBlbnZpZWQuCi8vLwovLy8gQ3JlYXRlIGEgYC5lbnZgIGZpbGUgYXQgdGhlIHByb2plY3Qgcm9vdCB3aXRoIHlvdXIga2V5czoKLy8vIGBgYAovLy8gQkFTRV9VUkw9aHR0cHM6Ly9hcGkuZXhhbXBsZS5jb20KLy8vIGBgYApARW52aWVkKHBhdGg6ICcuZW52JykKYWJzdHJhY3QgY2xhc3MgRW52IHsKICBARW52aWVkRmllbGQodmFyTmFtZTogJ0JBU0VfVVJMJykKICBzdGF0aWMgY29uc3QgU3RyaW5nIGJhc2VVcmwgPSBfRW52LmJhc2VVcmw7Cn0Ke3svaXNfcHJlc2V0X2VudGVycHJpc2V9fQo=",
      "type": "text",
    },
    {
      "path": "lib/core/constants/app_constants.dart",
      "data":
          "Ly8vIEFwcGxpY2F0aW9uLXdpZGUgY29uc3RhbnRzLgpjbGFzcyBBcHBDb25zdGFudHMgewogIEFwcENvbnN0YW50cy5fKCk7CgogIHN0YXRpYyBjb25zdCBTdHJpbmcgYXBwTmFtZSA9ICd7e3Byb2plY3RfbmFtZS50aXRsZUNhc2UoKX19JzsKfQo=",
      "type": "text",
    },
    {
      "path": "lib/core/network/dio_client.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmRpby9kaW8uZGFydCc7CmltcG9ydCAncGFja2FnZTpmbHV0dGVyL2ZvdW5kYXRpb24uZGFydCc7CgppbXBvcnQgJy4uL2NvbmZpZy9lbnYuZGFydCc7CgovLy8gQ29uZmlndXJlZCBEaW8gSFRUUCBjbGllbnQuCmNsYXNzIERpb0NsaWVudCB7CiAgRGlvQ2xpZW50Ll8oKTsKCiAgc3RhdGljIERpbz8gX2luc3RhbmNlOwoKICBzdGF0aWMgRGlvIGdldCBpbnN0YW5jZSB7CiAgICByZXR1cm4gX2luc3RhbmNlID8/PSBfY3JlYXRlQ2xpZW50KCk7CiAgfQoKICBzdGF0aWMgRGlvIF9jcmVhdGVDbGllbnQoKSB7CiAgICBmaW5hbCBjbGllbnQgPSBEaW8oCiAgICAgIEJhc2VPcHRpb25zKAogICAgICAgIGJhc2VVcmw6IEVudi5iYXNlVXJsLAogICAgICAgIGNvbm5lY3RUaW1lb3V0OiBjb25zdCBEdXJhdGlvbihzZWNvbmRzOiAzMCksCiAgICAgICAgcmVjZWl2ZVRpbWVvdXQ6IGNvbnN0IER1cmF0aW9uKHNlY29uZHM6IDMwKSwKICAgICAgICBoZWFkZXJzOiB7CiAgICAgICAgICAnQ29udGVudC1UeXBlJzogJ2FwcGxpY2F0aW9uL2pzb24nLAogICAgICAgICAgJ0FjY2VwdCc6ICdhcHBsaWNhdGlvbi9qc29uJywKICAgICAgICB9LAogICAgICApLAogICAgKTsKCiAgICBpZiAoa0RlYnVnTW9kZSkgewogICAgICBjbGllbnQuaW50ZXJjZXB0b3JzLmFkZCgKICAgICAgICBMb2dJbnRlcmNlcHRvcigKICAgICAgICAgIHJlcXVlc3Q6IGZhbHNlLAogICAgICAgICAgcmVxdWVzdEhlYWRlcjogZmFsc2UsCiAgICAgICAgICByZXF1ZXN0Qm9keTogZmFsc2UsCiAgICAgICAgICByZXNwb25zZUhlYWRlcjogZmFsc2UsCiAgICAgICAgICByZXNwb25zZUJvZHk6IGZhbHNlLAogICAgICAgICksCiAgICAgICk7CiAgICB9CgogICAgcmV0dXJuIGNsaWVudDsKICB9Cn0K",
      "type": "text",
    },
    {
      "path": "lib/core/theme/app_theme.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CgovLy8gQXBwbGljYXRpb24gdGhlbWUgY29uZmlndXJhdGlvbi4KY2xhc3MgQXBwVGhlbWUgewogIEFwcFRoZW1lLl8oKTsKCiAgc3RhdGljIFRoZW1lRGF0YSBnZXQgbGlnaHRUaGVtZSB7CiAgICByZXR1cm4gVGhlbWVEYXRhKAogICAgICBjb2xvclNjaGVtZVNlZWQ6IENvbG9ycy5kZWVwUHVycGxlLAogICAgICB1c2VNYXRlcmlhbDM6IHRydWUsCiAgICAgIGJyaWdodG5lc3M6IEJyaWdodG5lc3MubGlnaHQsCiAgICApOwogIH0KCiAgc3RhdGljIFRoZW1lRGF0YSBnZXQgZGFya1RoZW1lIHsKICAgIHJldHVybiBUaGVtZURhdGEoCiAgICAgIGNvbG9yU2NoZW1lU2VlZDogQ29sb3JzLmRlZXBQdXJwbGUsCiAgICAgIHVzZU1hdGVyaWFsMzogdHJ1ZSwKICAgICAgYnJpZ2h0bmVzczogQnJpZ2h0bmVzcy5kYXJrLAogICAgKTsKICB9Cn0K",
      "type": "text",
    },
    {
      "path": "lib/core/utils/.gitkeep",
      "data": "Ly8gQ29yZSB1dGlsaXRpZXMgYmFycmVsIGV4cG9ydC4K",
      "type": "text",
    },
    {
      "path": "lib/features/home/data/models/.gitkeep",
      "data": "Ly8gSG9tZSBmZWF0dXJlIGRhdGEgbW9kZWxzIGJhcnJlbC4K",
      "type": "text",
    },
    {
      "path": "lib/features/home/data/repositories/.gitkeep",
      "data": "Ly8gSG9tZSBmZWF0dXJlIGRhdGEgcmVwb3NpdG9yaWVzIGJhcnJlbC4K",
      "type": "text",
    },
    {
      "path": "lib/features/home/domain/entities/.gitkeep",
      "data": "Ly8gSG9tZSBmZWF0dXJlIGRvbWFpbiBlbnRpdGllcyBiYXJyZWwuCg==",
      "type": "text",
    },
    {
      "path": "lib/features/home/domain/usecases/.gitkeep",
      "data": "Ly8gSG9tZSBmZWF0dXJlIGRvbWFpbiB1c2VjYXNlcyBiYXJyZWwuCg==",
      "type": "text",
    },
    {
      "path": "lib/features/home/presentation/pages/home_page.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CgpjbGFzcyBIb21lUGFnZSBleHRlbmRzIFN0YXRlbGVzc1dpZGdldCB7CiAgY29uc3QgSG9tZVBhZ2Uoe3N1cGVyLmtleX0pOwoKICBAb3ZlcnJpZGUKICBXaWRnZXQgYnVpbGQoQnVpbGRDb250ZXh0IGNvbnRleHQpIHsKICAgIHJldHVybiBTY2FmZm9sZCgKICAgICAgYXBwQmFyOiBBcHBCYXIoCiAgICAgICAgdGl0bGU6IGNvbnN0IFRleHQoJ3t7cHJvamVjdF9uYW1lLnRpdGxlQ2FzZSgpfX0nKSwKICAgICAgKSwKICAgICAgYm9keTogY29uc3QgQ2VudGVyKAogICAgICAgIGNoaWxkOiBUZXh0KAogICAgICAgICAgJ1dlbGNvbWUgdG8ge3twcm9qZWN0X25hbWUudGl0bGVDYXNlKCl9fSEnLAogICAgICAgICAgc3R5bGU6IFRleHRTdHlsZShmb250U2l6ZTogMjQpLAogICAgICAgICksCiAgICAgICksCiAgICApOwogIH0KfQo=",
      "type": "text",
    },
    {
      "path": "lib/features/home/presentation/widgets/.gitkeep",
      "data": "Ly8gSG9tZSBmZWF0dXJlIHdpZGdldHMgYmFycmVsLgo=",
      "type": "text",
    },
    {
      "path": "lib/main.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CmltcG9ydCAnYXBwL2FwcC5kYXJ0JzsKCnZvaWQgbWFpbigpIHsKICBydW5BcHAoY29uc3QgQXBwKCkpOwp9Cg==",
      "type": "text",
    },
    {
      "path": "lib/main_dev.dart",
      "data":
          "e3sjaXNfcHJlc2V0X2VudGVycHJpc2V9fWltcG9ydCAncGFja2FnZTpmbHV0dGVyL21hdGVyaWFsLmRhcnQnOwppbXBvcnQgJ2FwcC9hcHAuZGFydCc7CgovLy8gRGV2ZWxvcG1lbnQgZmxhdm9yIGVudHJ5IHBvaW50Lgp2b2lkIG1haW4oKSB7CiAgLy8gVE9ETzogSW5pdGlhbGl6ZSBkZXYgZW52aXJvbm1lbnQgY29uZmlnCiAgcnVuQXBwKGNvbnN0IEFwcCgpKTsKfQp7ey9pc19wcmVzZXRfZW50ZXJwcmlzZX19Cg==",
      "type": "text",
    },
    {
      "path": "lib/main_prod.dart",
      "data":
          "e3sjaXNfcHJlc2V0X2VudGVycHJpc2V9fWltcG9ydCAncGFja2FnZTpmbHV0dGVyL21hdGVyaWFsLmRhcnQnOwppbXBvcnQgJ2FwcC9hcHAuZGFydCc7CgovLy8gUHJvZHVjdGlvbiBmbGF2b3IgZW50cnkgcG9pbnQuCnZvaWQgbWFpbigpIHsKICAvLyBUT0RPOiBJbml0aWFsaXplIHByb2R1Y3Rpb24gZW52aXJvbm1lbnQgY29uZmlnCiAgcnVuQXBwKGNvbnN0IEFwcCgpKTsKfQp7ey9pc19wcmVzZXRfZW50ZXJwcmlzZX19Cg==",
      "type": "text",
    },
    {
      "path": "lib/main_stg.dart",
      "data":
          "e3sjaXNfcHJlc2V0X2VudGVycHJpc2V9fWltcG9ydCAncGFja2FnZTpmbHV0dGVyL21hdGVyaWFsLmRhcnQnOwppbXBvcnQgJ2FwcC9hcHAuZGFydCc7CgovLy8gU3RhZ2luZyBmbGF2b3IgZW50cnkgcG9pbnQuCnZvaWQgbWFpbigpIHsKICAvLyBUT0RPOiBJbml0aWFsaXplIHN0YWdpbmcgZW52aXJvbm1lbnQgY29uZmlnCiAgcnVuQXBwKGNvbnN0IEFwcCgpKTsKfQp7ey9pc19wcmVzZXRfZW50ZXJwcmlzZX19Cg==",
      "type": "text",
    },
    {
      "path": "test/widget_test.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CmltcG9ydCAncGFja2FnZTpmbHV0dGVyX3Rlc3QvZmx1dHRlcl90ZXN0LmRhcnQnOwppbXBvcnQgJ3BhY2thZ2U6e3twcm9qZWN0X25hbWV9fS9hcHAvYXBwLmRhcnQnOwoKdm9pZCBtYWluKCkgewogIHRlc3RXaWRnZXRzKCdIb21lIHBhZ2UgbG9hZHMgc3RhdGUnLCAodGVzdGVyKSBhc3luYyB7CiAgICBhd2FpdCB0ZXN0ZXIucHVtcFdpZGdldChjb25zdCBBcHAoKSk7CiAgICBhd2FpdCB0ZXN0ZXIucHVtcEFuZFNldHRsZSgpOwoKICAgIGV4cGVjdChmaW5kLnRleHQoJ0hvbWUgUGFnZScpLCBmaW5kc09uZVdpZGdldCk7CiAgICBleHBlY3QoZmluZC50ZXh0KCdTdGF0dXM6IGluaXRpYWwnKSwgZmluZHNPbmVXaWRnZXQpOwoKICAgIGF3YWl0IHRlc3Rlci50YXAoZmluZC53aWRnZXRXaXRoVGV4dChFbGV2YXRlZEJ1dHRvbiwgJ0xvYWQnKSk7CiAgICBhd2FpdCB0ZXN0ZXIucHVtcEFuZFNldHRsZSgpOwoKICAgIGV4cGVjdChmaW5kLnRleHQoJ1N0YXR1czogc3VjY2VzcycpLCBmaW5kc09uZVdpZGdldCk7CiAgICBleHBlY3QodGVzdGVyLnRha2VFeGNlcHRpb24oKSwgaXNOdWxsKTsKICB9KTsKfQo=",
      "type": "text",
    },
  ],
  "hooks": [],
  "name": "project_structure",
  "description": "Generates Feature-First Flutter project structure.",
  "version": "0.1.0",
  "environment": {"mason": "any"},
  "vars": {
    "project_name": {
      "type": "string",
      "description": "The project name in snake_case.",
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
    "use_firebase": {
      "type": "boolean",
      "description": "Whether to include Firebase setup.",
      "default": false,
    },
    "is_preset_enterprise": {
      "type": "boolean",
      "description": "Whether this is an Enterprise preset.",
      "default": false,
    },
  },
});
