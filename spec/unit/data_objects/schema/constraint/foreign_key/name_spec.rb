require 'spec_helper'
require 'do-schema/constraint'

describe 'DataObjects::Schema::ForeignKey#name' do

  subject { foreign_key.name }

  let(:foreign_key)   { DataObjects::Schema::Constraint::ForeignKey.new(name, fk_columns, reference, options) }

  let(:name)          { 'foreign_key'                                          }
  let(:fk_columns)    { DataObjects::Schema::Columns.new([fk_column])          }
  let(:fk_column)     { DataObjects::Schema::Column.new('fk_column', {})       }
  let(:reference)     { DataObjects::Schema::Reference.new(table, ref_columns) }
  let(:table)         { DataObjects::Schema::Table.new('table', table_columns) }
  let(:table_columns) { DataObjects::Schema::Columns.new([table_column])       }
  let(:table_column)  { DataObjects::Schema::Column.new('table_column', {})    }
  let(:ref_columns)   { DataObjects::Schema::Columns.new([ref_column])         }
  let(:ref_column)    { DataObjects::Schema::Column.new('ref_column', {})      }
  let(:options)       { { :on_delete => on_delete, :on_update => on_update }   }
  let(:on_delete)     { :restrict                                              }
  let(:on_update)     { :restrict                                              }

  it { should == name }

end

