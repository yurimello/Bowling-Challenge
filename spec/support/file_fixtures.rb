module FileFixtures
  def file_fixture(fixture_name)
    path = Pathname.new(File.join('spec/fixtures/negative', fixture_name))
    path = Pathname.new(File.join('spec/fixtures/positive', fixture_name)) unless path.exist?
    return path if path.exist?

    msg = "the directory '%s' does not contain a file named '%s'"
    raise ArgumentError, format(msg, 'spec/fixtures', fixture_name)
  end
end
