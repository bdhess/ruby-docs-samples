# Copyright 2016 Google, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in write, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START detect_labels]
def detect_labels path_to_image_file:
  # [START import_libraries]
  require "google/cloud/vision"
  # [END import_libraries]

  # [START authenticate]
  vision = Google::Cloud::Vision.new
  # [END authenticate]

  # [START annotate_image]
  image      = vision.image path_to_image_file
  annotation = vision.annotate image, labels: true
  labels     = annotation.labels
  # [END annotate_image]

  # [START print_labels]
  puts "Image labels:"
  labels.each do |label|
    puts label.description
  end
  # [END print_labels]
end

# [START run_application]
if __FILE__ == $PROGRAM_NAME
  image_file = ARGV.shift

  if image_file
    detect_labels path_to_image_file: image_file
  else
    puts <<-usage
Usage: ruby detect_labels.rb image_file

Example:
  ruby detect_labels.rb images/cat.jpg
    usage
  end
end
# [END run_application]
# [END detect_labels]
