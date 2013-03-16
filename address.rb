require 'dm-core'
require 'dm-migrations'

class Address
  include DataMapper::Resource
  property :id, Serial
  property :street_number, Integer
  property :family, String
  property :phone_number, String
end

module AddressHelpers
  def create_address
    @address = Address.create(params[:address])
  end
end

helpers AddressHelpers

DataMapper.finalize
