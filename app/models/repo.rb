class Repo < SimpleDelegator
  include Githubable

  def self.all
    repos = [].tap do |results|
      results << client.repositories(:type => "public")
      results << client.organizations.map do |org|
        client.repositories(org.login, :type => "public")
      end
    end

    repos.flatten!

    repos.map do |r|
      new(r)
    end
  end

  def github_pageable?
    name.ends_with?(".github.io") ||
      client.branches(full_name).any? { |b| b.name == "gh_pages" }
  end
end
