class Repository
  include Githubable
  include ActiveModel::Model
  attr_accessor :name

  def self.all
    repositories = []
    repositories << gh_client.repositories
    gh_client.organizations.each do |org|
      repositories << gh_client.repositories(org.login)
    end
    repositories.tap(&:flatten!).map do |repo|
      Repository.new(:name => repo.name)
    end
  end

  def self.with_suffix(suffix)
    all.select { |r| r.name =~ /#{Regexp.quote(suffix)}$/ }
  end
end
