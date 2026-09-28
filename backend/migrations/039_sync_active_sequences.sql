SELECT setval(
  pg_get_serial_sequence('school_messages', 'id'),
  COALESCE((SELECT MAX(id) FROM school_messages), 0) + 1,
  false
);

SELECT setval(
  pg_get_serial_sequence('grades', 'id'),
  COALESCE((SELECT MAX(id) FROM grades), 0) + 1,
  false
);

SELECT setval(
  pg_get_serial_sequence('security_guard_permissions', 'id'),
  COALESCE((SELECT MAX(id) FROM security_guard_permissions), 0) + 1,
  false
);