#
# Copyright 2015, SUSE Linux GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module Crowbar
  module Client
    module Filter
      #
      # Filter to reduce a hash subset by a given search clause
      #
      class Subset < Base
        def process
          options[:filter].to_s.split(".").each do |segment|
            segment = segment.to_i if segment.to_i.to_s == segment
            options[:values] = subset(segment)
          end

          options[:values]
        end

        protected

        def subset(segment)
          case
          when options[:values][segment.to_i].present?
            options[:values][segment.to_i]
          when options[:values][segment.to_sym].present?
            options[:values][segment.to_sym]
          when options[:values][segment.to_s].present?
            options[:values][segment.to_s]
          end
        end
      end
    end
  end
end
