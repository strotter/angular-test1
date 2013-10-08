require 'ar_base'

migrator = ActiveRecord::Migrator.new(:up, './migrate/')

if migrator.pending_migrations.size > 0
  migrator.migrate
end
