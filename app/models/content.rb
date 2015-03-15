class Content < SimpleDelegator
  include Githubable

  def self.path(*args)
    options = args.extract_options!
    client.contents(options[:repo], :path => options[:path]).map do |content|
      new(content)
    end
  rescue Octokit::NotFound
    []
  end

  def directory?
    type == "dir"
  end
end
