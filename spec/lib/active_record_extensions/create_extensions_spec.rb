require 'spec_helper'
require 'support/test_model'

describe ActiveRecordExtensions::CreateExtensions do
  describe '.update_or_create' do

    context 'when no records exists previously' do
      subject do
        TestModel.update_or_create({day: Date.today}, {foo: :bar})
      end

      it { should be_an_instance_of TestModel }

      it 'should have one record of type TestModel' do
        expect(subject.class.count).to eq 1
      end

      it 'should update the value of foo' do
        expect(subject.class.find_by_day(Date.today).foo).to eq "bar"
      end
    end

    context 'when a record already exists' do
      before do
        TestModel.update_or_create({day: Date.today}, {foo: :bar})
      end

      subject do
        TestModel.update_or_create({day: Date.today}, {foo: :newbar})
      end

      it { should be_an_instance_of TestModel }

      it 'should have one record of type TestModel' do
        expect(subject.class.count).to eq 1
      end

      it 'should update the value of foo to the new value' do
        expect(subject.class.find_by_day(Date.today).foo).to eq "newbar"
      end
    end
  end

  describe '.delete_then_create' do
    context 'when previous records exists' do
      let(:matched_attributes) { { day: Date.today } }
      let(:updated_record_foo) { 'baz' }

      before do
        TestModel.update_or_create(matched_attributes, {foo: 'bar'})
        TestModel.update_or_create(matched_attributes, {foo: updated_record_foo})
      end

      it 'should have not added new records' do
        expect(TestModel.count).to eq 1
      end

      it 'should have updated the record' do
        expect(TestModel.first.foo).to eq updated_record_foo
      end
    end

    context 'when previous records does not exists' do
      let(:day) { Date.today }
      let(:foo) { 'bar' }

      before do
        TestModel.update_or_create({ day: day }, {foo: foo})
      end

      it 'should have added one new record' do
        expect(TestModel.count).to eq 1
      end

      it 'should have set the day of record' do
        expect(TestModel.first.day).to eq day
      end

      it 'should have set the foo of record' do
        expect(TestModel.first.foo).to eq foo
      end
    end
  end
end
