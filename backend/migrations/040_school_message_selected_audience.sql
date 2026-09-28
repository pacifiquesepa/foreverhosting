ALTER TABLE school_messages
  ALTER COLUMN audience_scope DROP DEFAULT;

ALTER TABLE school_messages
  ALTER COLUMN audience_scope TYPE VARCHAR(40) USING audience_scope::text;

ALTER TABLE school_messages
  ALTER COLUMN audience_scope SET DEFAULT 'all';