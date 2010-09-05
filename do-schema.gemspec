# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{do-schema}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dirkjan Bussink"]
  s.date = %q{2010-09-05}
  s.description = %q{TODO: longer description of your gem}
  s.email = %q{d.bussink@gmail.com}
  s.executables = ["autospec", "autotest", "churn", "edit_json.rb", "flay", "flog", "heckle", "jeweler", "mkspec", "mspec", "mspec-ci", "mspec-run", "mspec-tag", "multigem", "multiruby", "multiruby_setup", "parse_tree_abc", "parse_tree_audit", "parse_tree_deps", "parse_tree_show", "prettify_json.rb", "r2r_show", "rake", "rcov", "reek", "roodi", "roodi-describe", "ruby_parse", "rubyforge", "saikuro", "sow", "spec", "unit_diff", "yard-graph", "yardoc", "yardstick", "yri", "zentest"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc",
     "TODO"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "TODO",
     "VERSION",
     "config/flay.yml",
     "config/flog.yml",
     "config/rcov.yml",
     "config/roodi.yml",
     "config/site.reek",
     "config/yardstick.yml",
     "do-schema.gemspec",
     "lib/do-schema.rb",
     "lib/do-schema/column.rb",
     "lib/do-schema/column/integer.rb",
     "lib/do-schema/column/string.rb",
     "lib/do-schema/constraint.rb",
     "lib/do-schema/database.rb",
     "lib/do-schema/index.rb",
     "lib/do-schema/reference.rb",
     "lib/do-schema/support/equalizable.rb",
     "lib/do-schema/support/ordered_set.rb",
     "lib/do-schema/support/transformable.rb",
     "lib/do-schema/table.rb",
     "spec/rcov.opts",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/unit/data_objects/schema/class_methods/load_spec.rb",
     "spec/unit/data_objects/schema/column/default_options_spec.rb",
     "spec/unit/data_objects/schema/column/default_spec.rb",
     "spec/unit/data_objects/schema/column/eql_spec.rb",
     "spec/unit/data_objects/schema/column/equal_value_spec.rb",
     "spec/unit/data_objects/schema/column/hash_spec.rb",
     "spec/unit/data_objects/schema/column/initialize_spec.rb",
     "spec/unit/data_objects/schema/column/name_spec.rb",
     "spec/unit/data_objects/schema/column/required_spec.rb",
     "spec/unit/data_objects/schema/columns/append_spec.rb",
     "spec/unit/data_objects/schema/columns/each_spec.rb",
     "spec/unit/data_objects/schema/columns/empty_spec.rb",
     "spec/unit/data_objects/schema/columns/entries_spec.rb",
     "spec/unit/data_objects/schema/columns/eql_spec.rb",
     "spec/unit/data_objects/schema/columns/equal_value_spec.rb",
     "spec/unit/data_objects/schema/columns/hash_spec.rb",
     "spec/unit/data_objects/schema/columns/include_spec.rb",
     "spec/unit/data_objects/schema/columns/initialize_spec.rb",
     "spec/unit/data_objects/schema/columns/length_spec.rb",
     "spec/unit/data_objects/schema/columns/merge_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/name_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/on_delete_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/on_update_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/reference_spec.rb",
     "spec/unit/data_objects/schema/constraint/primary_key/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/primary_key/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/primary_key/name_spec.rb",
     "spec/unit/data_objects/schema/constraint/table_constraint/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/table_constraint/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/table_constraint/name_spec.rb",
     "spec/unit/data_objects/schema/constraint/unique/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/unique/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/unique/name_spec.rb",
     "spec/unit/data_objects/schema/database/empty_spec.rb",
     "spec/unit/data_objects/schema/database/initialize_spec.rb",
     "spec/unit/data_objects/schema/database/name_spec.rb",
     "spec/unit/data_objects/schema/database/tables_spec.rb",
     "spec/unit/data_objects/schema/database/uri_spec.rb",
     "spec/unit/data_objects/schema/index/columns_spec.rb",
     "spec/unit/data_objects/schema/index/initialize_spec.rb",
     "spec/unit/data_objects/schema/index/name_spec.rb",
     "spec/unit/data_objects/schema/index/shared/columns_spec.rb",
     "spec/unit/data_objects/schema/index/shared/initialize_spec.rb",
     "spec/unit/data_objects/schema/index/shared/name_spec.rb",
     "spec/unit/data_objects/schema/index/unique/columns_spec.rb",
     "spec/unit/data_objects/schema/index/unique/initialize_spec.rb",
     "spec/unit/data_objects/schema/index/unique/name_spec.rb",
     "spec/unit/data_objects/schema/index/unique/shared/unique_spec.rb",
     "spec/unit/data_objects/schema/index/unique/unique_spec.rb",
     "spec/unit/data_objects/schema/index/unique_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/append_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/each_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/empty_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/entries_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/eql_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/equal_value_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/hash_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/include_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/index_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/initialize_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/length_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/merge_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/append_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/each_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/empty_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/entries_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/include_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/index_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/initialize_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/length_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/merge_spec.rb",
     "spec/unit/data_objects/schema/reference/columns_spec.rb",
     "spec/unit/data_objects/schema/reference/initialize_spec.rb",
     "spec/unit/data_objects/schema/reference/table_spec.rb",
     "spec/unit/data_objects/schema/table/columns_spec.rb",
     "spec/unit/data_objects/schema/table/each_spec.rb",
     "spec/unit/data_objects/schema/table/eql_spec.rb",
     "spec/unit/data_objects/schema/table/equal_value_spec.rb",
     "spec/unit/data_objects/schema/table/hash_spec.rb",
     "spec/unit/data_objects/schema/table/initialize_spec.rb",
     "spec/unit/data_objects/schema/table/name_spec.rb",
     "spec/unit/data_objects/schema/tables/append_spec.rb",
     "spec/unit/data_objects/schema/tables/each_spec.rb",
     "spec/unit/data_objects/schema/tables/empty_spec.rb",
     "spec/unit/data_objects/schema/tables/entries_spec.rb",
     "spec/unit/data_objects/schema/tables/eql_spec.rb",
     "spec/unit/data_objects/schema/tables/equal_value_spec.rb",
     "spec/unit/data_objects/schema/tables/hash_spec.rb",
     "spec/unit/data_objects/schema/tables/include_spec.rb",
     "spec/unit/data_objects/schema/tables/initialize_spec.rb",
     "spec/unit/data_objects/schema/tables/length_spec.rb",
     "spec/unit/data_objects/schema/tables/merge_spec.rb",
     "spec/unit/data_objects/schema/transformable/fixtures/dummy.rb",
     "spec/unit/data_objects/schema/transformable/transform_spec.rb",
     "spec/unit/data_objects/schema/transformable/transform_unless_spec.rb",
     "tasks/ci.rake",
     "tasks/clean.rake",
     "tasks/quality/flay.rake",
     "tasks/quality/flog.rake",
     "tasks/quality/heckle.rake",
     "tasks/quality/metric_fu.rake",
     "tasks/quality/reek.rake",
     "tasks/quality/roodi.rake",
     "tasks/quality/yardstick.rake",
     "tasks/spec.rake",
     "tasks/whitespace.rake",
     "tasks/yard.rake"
  ]
  s.homepage = %q{http://github.com/dbussink/do-schema}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/unit/data_objects/schema/class_methods/load_spec.rb",
     "spec/unit/data_objects/schema/column/default_options_spec.rb",
     "spec/unit/data_objects/schema/column/default_spec.rb",
     "spec/unit/data_objects/schema/column/eql_spec.rb",
     "spec/unit/data_objects/schema/column/equal_value_spec.rb",
     "spec/unit/data_objects/schema/column/hash_spec.rb",
     "spec/unit/data_objects/schema/column/initialize_spec.rb",
     "spec/unit/data_objects/schema/column/name_spec.rb",
     "spec/unit/data_objects/schema/column/required_spec.rb",
     "spec/unit/data_objects/schema/columns/append_spec.rb",
     "spec/unit/data_objects/schema/columns/each_spec.rb",
     "spec/unit/data_objects/schema/columns/empty_spec.rb",
     "spec/unit/data_objects/schema/columns/entries_spec.rb",
     "spec/unit/data_objects/schema/columns/eql_spec.rb",
     "spec/unit/data_objects/schema/columns/equal_value_spec.rb",
     "spec/unit/data_objects/schema/columns/hash_spec.rb",
     "spec/unit/data_objects/schema/columns/include_spec.rb",
     "spec/unit/data_objects/schema/columns/initialize_spec.rb",
     "spec/unit/data_objects/schema/columns/length_spec.rb",
     "spec/unit/data_objects/schema/columns/merge_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/name_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/on_delete_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/on_update_spec.rb",
     "spec/unit/data_objects/schema/constraint/foreign_key/reference_spec.rb",
     "spec/unit/data_objects/schema/constraint/primary_key/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/primary_key/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/primary_key/name_spec.rb",
     "spec/unit/data_objects/schema/constraint/table_constraint/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/table_constraint/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/table_constraint/name_spec.rb",
     "spec/unit/data_objects/schema/constraint/unique/columns_spec.rb",
     "spec/unit/data_objects/schema/constraint/unique/initialize_spec.rb",
     "spec/unit/data_objects/schema/constraint/unique/name_spec.rb",
     "spec/unit/data_objects/schema/database/empty_spec.rb",
     "spec/unit/data_objects/schema/database/initialize_spec.rb",
     "spec/unit/data_objects/schema/database/name_spec.rb",
     "spec/unit/data_objects/schema/database/tables_spec.rb",
     "spec/unit/data_objects/schema/database/uri_spec.rb",
     "spec/unit/data_objects/schema/index/columns_spec.rb",
     "spec/unit/data_objects/schema/index/initialize_spec.rb",
     "spec/unit/data_objects/schema/index/name_spec.rb",
     "spec/unit/data_objects/schema/index/shared/columns_spec.rb",
     "spec/unit/data_objects/schema/index/shared/initialize_spec.rb",
     "spec/unit/data_objects/schema/index/shared/name_spec.rb",
     "spec/unit/data_objects/schema/index/unique/columns_spec.rb",
     "spec/unit/data_objects/schema/index/unique/initialize_spec.rb",
     "spec/unit/data_objects/schema/index/unique/name_spec.rb",
     "spec/unit/data_objects/schema/index/unique/shared/unique_spec.rb",
     "spec/unit/data_objects/schema/index/unique/unique_spec.rb",
     "spec/unit/data_objects/schema/index/unique_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/append_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/each_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/empty_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/entries_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/eql_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/equal_value_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/hash_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/include_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/index_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/initialize_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/length_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/merge_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/append_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/each_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/empty_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/entries_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/include_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/index_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/initialize_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/length_spec.rb",
     "spec/unit/data_objects/schema/ordered_set/shared/merge_spec.rb",
     "spec/unit/data_objects/schema/reference/columns_spec.rb",
     "spec/unit/data_objects/schema/reference/initialize_spec.rb",
     "spec/unit/data_objects/schema/reference/table_spec.rb",
     "spec/unit/data_objects/schema/table/columns_spec.rb",
     "spec/unit/data_objects/schema/table/each_spec.rb",
     "spec/unit/data_objects/schema/table/eql_spec.rb",
     "spec/unit/data_objects/schema/table/equal_value_spec.rb",
     "spec/unit/data_objects/schema/table/hash_spec.rb",
     "spec/unit/data_objects/schema/table/initialize_spec.rb",
     "spec/unit/data_objects/schema/table/name_spec.rb",
     "spec/unit/data_objects/schema/tables/append_spec.rb",
     "spec/unit/data_objects/schema/tables/each_spec.rb",
     "spec/unit/data_objects/schema/tables/empty_spec.rb",
     "spec/unit/data_objects/schema/tables/entries_spec.rb",
     "spec/unit/data_objects/schema/tables/eql_spec.rb",
     "spec/unit/data_objects/schema/tables/equal_value_spec.rb",
     "spec/unit/data_objects/schema/tables/hash_spec.rb",
     "spec/unit/data_objects/schema/tables/include_spec.rb",
     "spec/unit/data_objects/schema/tables/initialize_spec.rb",
     "spec/unit/data_objects/schema/tables/length_spec.rb",
     "spec/unit/data_objects/schema/tables/merge_spec.rb",
     "spec/unit/data_objects/schema/transformable/fixtures/dummy.rb",
     "spec/unit/data_objects/schema/transformable/transform_spec.rb",
     "spec/unit/data_objects/schema/transformable/transform_unless_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end

