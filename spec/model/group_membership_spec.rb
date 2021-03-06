# -*- encoding: utf-8 -*-

# Copyright (c) Microsoft Corporation
# All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY
# IMPLIED WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR
# PURPOSE, MERCHANTABLITY OR NON-INFRINGEMENT.
#
# See the Apache Version 2.0 License for specific language governing
# permissions and limitations under the License.

require File.expand_path('../../spec_helper', __FILE__)

describe Yammer::GroupMembership do

  before :all do
    Yammer.configure do |conf|
      conf.access_token = 'TolNOFka9Uls2DxahNi78A'
    end
  end

  after :all do
    Yammer.reset!
  end

  context 'class methods' do

    subject { Yammer::GroupMembership }

    describe '#create_group_membership' do
      it 'creates a new group membership' do
        stub_request(:post, "https://www.yammer.com/api/v1/group_memberships").with(
          :body    => { :group_id => '6' },
          :headers => {
            'Accept'          => 'application/json',
            'Authorization'   => "Bearer #{Yammer.access_token}",
            'Content-Type'    => 'application/x-www-form-urlencoded',
            'User-Agent'      => "Yammer Ruby Gem #{Yammer::Version}"
          }
        ).to_return(
          :status => 201,
          :body => '',
          :headers => {}
        )
        subject.create(6)
      end
    end
  end
end