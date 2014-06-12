require 'octokit'

class SearchController < ApplicationController
  def index
  end
  
  def pulls
    @pulls = pulls_for_branch(params[:branch])
    @issues = issues_for_pulls(*@pulls.map { |pull| pull["number"] })
    @issues = @issues.items.inject({}) do |hash, issue|
      hash["##{issue['number']}"] = issue
      hash
    end
    @pulls = @pulls.map do |pull|
      pull["labels"] = @issues["##{pull["number"]}"]["labels"]
      pull
    end
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def pulls_for_branch(branch)
    client.pull_requests(ENV["HIKU_GITHUB_REPOSITORY"], base: branch)
  end
  
  def issues_for_pulls(*pulls)
    client.search_issues("#{pulls.join(' ')} repo:#{ENV['HIKU_GITHUB_REPOSITORY']}")
  end
  
  def client
    @client ||= Octokit::Client.new access_token: current_user.access_token
  end
end
