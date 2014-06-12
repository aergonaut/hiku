require 'octokit'

class SearchController < ApplicationController
  def index
  end
  
  def pulls
    @pulls = pulls_for_branch(params[:branch])
    @pulls = @pulls.map do |pull|
      issue = issue_for_pull(pull["number"])
      pull["labels"] = issue["labels"]
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
  
  def issue_for_pull(pull_number)
    client.issue(ENV["HIKU_GITHUB_REPOSITORY"], pull_number)
  end
  
  def client
    @client ||= Octokit::Client.new access_token: ENV["HIKU_GITHUB_ACCESS_TOKEN"]
  end
end
