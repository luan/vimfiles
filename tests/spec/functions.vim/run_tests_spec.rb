describe 'running tests with luan vim' do
  before do
    if vipe_file.exist?
      vipe_file.delete
    end
  end

  let(:vim_with_functions) {
      vim.source("#{ENV['HOME']}/.vim/plugged/vipe/plugin/vipe.vim")
      vim.source("#{ENV['HOME']}/.vim/lib/functions.vim")

      dir, filename = test_path.split
      vim.command("cd #{dir}")
      vim.edit(filename)
      vim
  }

  let(:vipe_file) {
    Pathname.new('/tmp')
      .join(".vipe_pipe_#{test_path.dirname.to_s.gsub('/', '_')}")
  }

  let(:last_command) {
    vipe_file.readlines.last.chomp
  }

  let(:fixture_path) {
      Pathname.new(ENV['HOME']).join(
        '.vim',
        'tests',
        'spec',
        'fixtures'
      )
  }

  def run_test_file(vim)
    vim.command('call RunTestFile()')
  end

  context 'editing an rspec file' do
    let(:test_path) {
      fixture_path.join(
        'ruby',
        'rspec_spec.rb'
      )
    }

    it 'runs the rspec command' do
      run_test_file(vim_with_functions)
      expect(last_command).to eq('rspec --color rspec_spec.rb')
    end
  end

  context 'editing an rspec file in a bundler environment' do
    let(:test_path) {
      fixture_path.join(
        'ruby_with_bundler',
        'rspec_spec.rb'
      )
    }

    it 'runs the rspec command in the bundler environment' do
      run_test_file(vim_with_functions)
      expect(last_command).to eq('bundle exec rspec --color rspec_spec.rb')
    end
  end
end
