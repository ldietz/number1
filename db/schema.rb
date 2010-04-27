# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100425172555) do

  create_table "albums", :force => true do |t|
    t.string   "album"
    t.string   "year"
    t.string   "photo_url"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "columns_priv", :id => false, :force => true do |t|
    t.string    "Host",        :limit => 60, :default => "", :null => false
    t.string    "Db",          :limit => 64, :default => "", :null => false
    t.string    "User",        :limit => 16, :default => "", :null => false
    t.string    "Table_name",  :limit => 64, :default => "", :null => false
    t.string    "Column_name", :limit => 64, :default => "", :null => false
    t.timestamp "Timestamp",                                 :null => false
    t.date      "Column_priv", :limit => 0,                  :null => false
  end

  create_table "db", :id => false, :force => true do |t|
    t.string "Host",                  :limit => 60, :default => "",  :null => false
    t.string "Db",                    :limit => 64, :default => "",  :null => false
    t.string "User",                  :limit => 16, :default => "",  :null => false
    t.string "Select_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Insert_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Update_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Delete_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Create_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Drop_priv",             :limit => 0,  :default => "N", :null => false
    t.string "Grant_priv",            :limit => 0,  :default => "N", :null => false
    t.string "References_priv",       :limit => 0,  :default => "N", :null => false
    t.string "Index_priv",            :limit => 0,  :default => "N", :null => false
    t.string "Alter_priv",            :limit => 0,  :default => "N", :null => false
    t.string "Create_tmp_table_priv", :limit => 0,  :default => "N", :null => false
    t.string "Lock_tables_priv",      :limit => 0,  :default => "N", :null => false
    t.string "Create_view_priv",      :limit => 0,  :default => "N", :null => false
    t.string "Show_view_priv",        :limit => 0,  :default => "N", :null => false
    t.string "Create_routine_priv",   :limit => 0,  :default => "N", :null => false
    t.string "Alter_routine_priv",    :limit => 0,  :default => "N", :null => false
    t.string "Execute_priv",          :limit => 0,  :default => "N", :null => false
    t.string "Event_priv",            :limit => 0,  :default => "N", :null => false
    t.string "Trigger_priv",          :limit => 0,  :default => "N", :null => false
  end

  add_index "db", ["User"], :name => "User"

  create_table "event", :id => false, :force => true do |t|
    t.string    "db",                   :limit => 64,         :default => "",        :null => false
    t.string    "name",                 :limit => 64,         :default => "",        :null => false
    t.binary    "body",                 :limit => 2147483647,                        :null => false
    t.string    "definer",              :limit => 77,         :default => "",        :null => false
    t.datetime  "execute_at"
    t.integer   "interval_value"
    t.string    "interval_field",       :limit => 0
    t.timestamp "created",                                                           :null => false
    t.timestamp "modified",                                                          :null => false
    t.datetime  "last_executed"
    t.datetime  "starts"
    t.datetime  "ends"
    t.string    "status",               :limit => 0,          :default => "ENABLED", :null => false
    t.string    "on_completion",        :limit => 0,          :default => "DROP",    :null => false
    t.float     "sql_mode",             :limit => 0,                                 :null => false
    t.string    "comment",              :limit => 64,         :default => "",        :null => false
    t.integer   "originator",                                                        :null => false
    t.string    "time_zone",            :limit => 64,         :default => "SYSTEM",  :null => false
    t.string    "character_set_client", :limit => 32
    t.string    "collation_connection", :limit => 32
    t.string    "db_collation",         :limit => 32
    t.binary    "body_utf8",            :limit => 2147483647
  end

  create_table "func", :primary_key => "name", :force => true do |t|
    t.boolean "ret",                 :default => false, :null => false
    t.string  "dl",   :limit => 128, :default => "",    :null => false
    t.string  "type", :limit => 0,                      :null => false
  end

  create_table "general_log", :id => false, :force => true do |t|
    t.timestamp "event_time",                       :null => false
    t.text      "user_host",    :limit => 16777215, :null => false
    t.integer   "thread_id",                        :null => false
    t.integer   "server_id",                        :null => false
    t.string    "command_type", :limit => 64,       :null => false
    t.text      "argument",     :limit => 16777215, :null => false
  end

  create_table "help_category", :primary_key => "help_category_id", :force => true do |t|
    t.string  "name",               :limit => 64,  :null => false
    t.integer "parent_category_id", :limit => 2
    t.string  "url",                :limit => 128, :null => false
  end

  add_index "help_category", ["name"], :name => "name", :unique => true

  create_table "help_keyword", :primary_key => "help_keyword_id", :force => true do |t|
    t.string "name", :limit => 64, :null => false
  end

  add_index "help_keyword", ["name"], :name => "name", :unique => true

  create_table "help_relation", :id => false, :force => true do |t|
    t.integer "help_topic_id",   :null => false
    t.integer "help_keyword_id", :null => false
  end

  create_table "help_topic", :primary_key => "help_topic_id", :force => true do |t|
    t.string  "name",             :limit => 64,  :null => false
    t.integer "help_category_id", :limit => 2,   :null => false
    t.text    "description",                     :null => false
    t.text    "example",                         :null => false
    t.string  "url",              :limit => 128, :null => false
  end

  add_index "help_topic", ["name"], :name => "name", :unique => true

  create_table "host", :id => false, :force => true do |t|
    t.string "Host",                  :limit => 60, :default => "",  :null => false
    t.string "Db",                    :limit => 64, :default => "",  :null => false
    t.string "Select_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Insert_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Update_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Delete_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Create_priv",           :limit => 0,  :default => "N", :null => false
    t.string "Drop_priv",             :limit => 0,  :default => "N", :null => false
    t.string "Grant_priv",            :limit => 0,  :default => "N", :null => false
    t.string "References_priv",       :limit => 0,  :default => "N", :null => false
    t.string "Index_priv",            :limit => 0,  :default => "N", :null => false
    t.string "Alter_priv",            :limit => 0,  :default => "N", :null => false
    t.string "Create_tmp_table_priv", :limit => 0,  :default => "N", :null => false
    t.string "Lock_tables_priv",      :limit => 0,  :default => "N", :null => false
    t.string "Create_view_priv",      :limit => 0,  :default => "N", :null => false
    t.string "Show_view_priv",        :limit => 0,  :default => "N", :null => false
    t.string "Create_routine_priv",   :limit => 0,  :default => "N", :null => false
    t.string "Alter_routine_priv",    :limit => 0,  :default => "N", :null => false
    t.string "Execute_priv",          :limit => 0,  :default => "N", :null => false
    t.string "Trigger_priv",          :limit => 0,  :default => "N", :null => false
  end

  create_table "ndb_binlog_index", :primary_key => "epoch", :force => true do |t|
    t.integer "Position",  :limit => 8, :null => false
    t.string  "File",                   :null => false
    t.integer "inserts",   :limit => 8, :null => false
    t.integer "updates",   :limit => 8, :null => false
    t.integer "deletes",   :limit => 8, :null => false
    t.integer "schemaops", :limit => 8, :null => false
  end

  create_table "plugin", :primary_key => "name", :force => true do |t|
    t.string "dl", :limit => 128, :default => "", :null => false
  end

  create_table "proc", :id => false, :force => true do |t|
    t.string    "db",                   :limit => 64,         :default => "",             :null => false
    t.string    "name",                 :limit => 64,         :default => "",             :null => false
    t.string    "type",                 :limit => 0,                                      :null => false
    t.string    "specific_name",        :limit => 64,         :default => "",             :null => false
    t.string    "language",             :limit => 0,          :default => "SQL",          :null => false
    t.string    "sql_data_access",      :limit => 0,          :default => "CONTAINS_SQL", :null => false
    t.string    "is_deterministic",     :limit => 0,          :default => "NO",           :null => false
    t.string    "security_type",        :limit => 0,          :default => "DEFINER",      :null => false
    t.binary    "param_list",                                                             :null => false
    t.binary    "returns",              :limit => 2147483647,                             :null => false
    t.binary    "body",                 :limit => 2147483647,                             :null => false
    t.string    "definer",              :limit => 77,         :default => "",             :null => false
    t.timestamp "created",                                                                :null => false
    t.timestamp "modified",                                                               :null => false
    t.float     "sql_mode",             :limit => 0,                                      :null => false
    t.string    "comment",              :limit => 64,         :default => "",             :null => false
    t.string    "character_set_client", :limit => 32
    t.string    "collation_connection", :limit => 32
    t.string    "db_collation",         :limit => 32
    t.binary    "body_utf8",            :limit => 2147483647
  end

# Could not dump table "procs_priv" because of following StandardError
#   Unknown type 'set('Execute','Alter Routine','Grant')' for column 'Proc_priv'

  create_table "servers", :primary_key => "Server_name", :force => true do |t|
    t.string  "Host",     :limit => 64, :default => "", :null => false
    t.string  "Db",       :limit => 64, :default => "", :null => false
    t.string  "Username", :limit => 64, :default => "", :null => false
    t.string  "Password", :limit => 64, :default => "", :null => false
    t.integer "Port",                   :default => 0,  :null => false
    t.string  "Socket",   :limit => 64, :default => "", :null => false
    t.string  "Wrapper",  :limit => 64, :default => "", :null => false
    t.string  "Owner",    :limit => 64, :default => "", :null => false
  end

  create_table "slow_log", :id => false, :force => true do |t|
    t.timestamp "start_time",                         :null => false
    t.text      "user_host",      :limit => 16777215, :null => false
    t.time      "query_time",                         :null => false
    t.time      "lock_time",                          :null => false
    t.integer   "rows_sent",                          :null => false
    t.integer   "rows_examined",                      :null => false
    t.string    "db",             :limit => 512,      :null => false
    t.integer   "last_insert_id",                     :null => false
    t.integer   "insert_id",                          :null => false
    t.integer   "server_id",                          :null => false
    t.text      "sql_text",       :limit => 16777215, :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.text     "lyrics"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables_priv", :id => false, :force => true do |t|
    t.string    "Host",        :limit => 60, :default => "", :null => false
    t.string    "Db",          :limit => 64, :default => "", :null => false
    t.string    "User",        :limit => 16, :default => "", :null => false
    t.string    "Table_name",  :limit => 64, :default => "", :null => false
    t.string    "Grantor",     :limit => 77, :default => "", :null => false
    t.timestamp "Timestamp",                                 :null => false
    t.date      "Table_priv",  :limit => 0,                  :null => false
    t.date      "Column_priv", :limit => 0,                  :null => false
  end

  add_index "tables_priv", ["Grantor"], :name => "Grantor"

  create_table "time_zone", :primary_key => "Time_zone_id", :force => true do |t|
    t.string "Use_leap_seconds", :limit => 0, :default => "N", :null => false
  end

  create_table "time_zone_leap_second", :primary_key => "Transition_time", :force => true do |t|
    t.integer "Correction", :null => false
  end

  create_table "time_zone_name", :primary_key => "Name", :force => true do |t|
    t.integer "Time_zone_id", :null => false
  end

  create_table "time_zone_transition", :id => false, :force => true do |t|
    t.integer "Time_zone_id",                    :null => false
    t.integer "Transition_time",    :limit => 8, :null => false
    t.integer "Transition_type_id",              :null => false
  end

  create_table "time_zone_transition_type", :id => false, :force => true do |t|
    t.integer "Time_zone_id",                                    :null => false
    t.integer "Transition_type_id",                              :null => false
    t.integer "Offset",                          :default => 0,  :null => false
    t.integer "Is_DST",             :limit => 1, :default => 0,  :null => false
    t.string  "Abbreviation",       :limit => 8, :default => "", :null => false
  end

  create_table "user", :id => false, :force => true do |t|
    t.string  "Host",                  :limit => 60, :default => "",  :null => false
    t.string  "User",                  :limit => 16, :default => "",  :null => false
    t.string  "Password",              :limit => 41, :default => "",  :null => false
    t.string  "Select_priv",           :limit => 0,  :default => "N", :null => false
    t.string  "Insert_priv",           :limit => 0,  :default => "N", :null => false
    t.string  "Update_priv",           :limit => 0,  :default => "N", :null => false
    t.string  "Delete_priv",           :limit => 0,  :default => "N", :null => false
    t.string  "Create_priv",           :limit => 0,  :default => "N", :null => false
    t.string  "Drop_priv",             :limit => 0,  :default => "N", :null => false
    t.string  "Reload_priv",           :limit => 0,  :default => "N", :null => false
    t.string  "Shutdown_priv",         :limit => 0,  :default => "N", :null => false
    t.string  "Process_priv",          :limit => 0,  :default => "N", :null => false
    t.string  "File_priv",             :limit => 0,  :default => "N", :null => false
    t.string  "Grant_priv",            :limit => 0,  :default => "N", :null => false
    t.string  "References_priv",       :limit => 0,  :default => "N", :null => false
    t.string  "Index_priv",            :limit => 0,  :default => "N", :null => false
    t.string  "Alter_priv",            :limit => 0,  :default => "N", :null => false
    t.string  "Show_db_priv",          :limit => 0,  :default => "N", :null => false
    t.string  "Super_priv",            :limit => 0,  :default => "N", :null => false
    t.string  "Create_tmp_table_priv", :limit => 0,  :default => "N", :null => false
    t.string  "Lock_tables_priv",      :limit => 0,  :default => "N", :null => false
    t.string  "Execute_priv",          :limit => 0,  :default => "N", :null => false
    t.string  "Repl_slave_priv",       :limit => 0,  :default => "N", :null => false
    t.string  "Repl_client_priv",      :limit => 0,  :default => "N", :null => false
    t.string  "Create_view_priv",      :limit => 0,  :default => "N", :null => false
    t.string  "Show_view_priv",        :limit => 0,  :default => "N", :null => false
    t.string  "Create_routine_priv",   :limit => 0,  :default => "N", :null => false
    t.string  "Alter_routine_priv",    :limit => 0,  :default => "N", :null => false
    t.string  "Create_user_priv",      :limit => 0,  :default => "N", :null => false
    t.string  "Event_priv",            :limit => 0,  :default => "N", :null => false
    t.string  "Trigger_priv",          :limit => 0,  :default => "N", :null => false
    t.string  "ssl_type",              :limit => 0,  :default => "",  :null => false
    t.binary  "ssl_cipher",                                           :null => false
    t.binary  "x509_issuer",                                          :null => false
    t.binary  "x509_subject",                                         :null => false
    t.integer "max_questions",                       :default => 0,   :null => false
    t.integer "max_updates",                         :default => 0,   :null => false
    t.integer "max_connections",                     :default => 0,   :null => false
    t.integer "max_user_connections",                :default => 0,   :null => false
  end

end
