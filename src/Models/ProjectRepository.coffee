BaseModel = require '../BaseModel'
Utils = require '../Utils'

class ProjectRepository extends BaseModel

  # === Branches
  listBranches: (projectId, fn = null) =>
    @debug "Projects::listBranches()"
    @get "projects/#{Utils.parseProjectId projectId}/repository/branches", (data) => fn data if fn

  showBranch: (projectId, branchId, fn = null) =>
    @debug "Projects::branch()"
    @get "projects/#{Utils.parseProjectId projectId}/repository/branches/#{encodeURI branchId}", (data) => fn data if fn

  ## TODO:
  # - Protect and
  # - Unprotect branch

  # === Tags
  listTags: (projectId, fn = null) =>
    @debug "Projects::listTags()"
    @get "projects/#{Utils.parseProjectId projectId}/repository/tags", (data) => fn data if fn

  # === Commits
  listCommits: (projectId, fn = null) =>
    @debug "Projects::listCommits()"
    @get "projects/#{Utils.parseProjectId projectId}/repository/commits", (data) => fn data if fn

  showCommit: (projectId, commitId, fn = null) =>
    @debug "Projects::commit()"
    @get "projects/#{Utils.parseProjectId projectId}/repository/branches/#{parseInt commitId}", (data) => fn data if fn

  diffCommit: (projectId, sha, fn = null) =>
    @debug "Projects::diffCommit()"
    @get "projects/#{Utils.parseProjectId projectId}/repository/branches/#{parseInt sha}", (data) => fn data if fn

  # === Tree
  listTree: (projectId, fn = null) =>
    @debug "Projects::listTree()"
    @get "projects/#{Utils.parseProjectId projectId}/repository/tree", (data) => fn data if fn

  # == Files
  createFile: (params = {}, fn = null) =>
    @debug "Projects::createFile()", params
    @post "projects/#{Utils.parseProjectId params.projectId}/repository/files", params, (data) => fn data if fn

  updateFile: (params = {}, fn = null) =>
    @debug "Projects::updateFile()", params
    @put "projects/#{Utils.parseProjectId params.projectId}/repository/files", params, (data) => fn data if fn

  ## TODO:
  # - Raw file content
  # - Raw blob content
  # - Get file archive
  # - Delete existing file in repository

module.exports = (client) -> new ProjectRepository client
