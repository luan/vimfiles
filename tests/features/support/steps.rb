require 'securerandom'
require 'tmpdir'
require 'tempfile'
require 'fileutils'
require 'vimrunner'
require 'pry'

Around do |scenario, block|
  Dir.mktmpdir do |tmpdir|
    Dir.chdir(tmpdir) do
      block.call
    end
  end
end

$vim = Vimrunner::Server.new(
  vimrc: '~/.vim/vimrc'
).start

at_exit do
  $vim.kill if $vim
end

Before do
  $vim.normal
  $vim.command "cd #{Dir.pwd}"
end

Given(/^I'm editing a file named "([^"]*)"$/) do |filename|
  $vim.feedkeys ":edit #{filename}\\<cr>"
end

Given(/^I'm editing a file named "(.*?)" with contents$/) do |filename, text|
  File.open(filename, 'w') { |f| f.write(text) }
  step %{I'm editing a file named "#{filename}"}
end

When(/^I insert the text "([^"]*)"$/) do |text|
  $vim.insert text
  $vim.normal
end

When(/^I hit "(.*?)"$/) do |keys|
  keys.gsub!(/\</, '\<')
  $vim.feedkeys keys
end

Then(/^the file "([^"]*)" should contain "([^"]*)"$/) do |filename, text|
  expect(File).to exist filename
  expect(File.read(filename)).to include text
end

When(/^I am inserting the text "(.*?)"$/) do |text|
  $vim.insert text
end

Then(/^the contents of the current line should be "(.*?)"$/) do |expected|
  expect($vim.echo 'getline(".")').to eq expected
end

When(/^I wait a second$/) do
  sleep 1
end
