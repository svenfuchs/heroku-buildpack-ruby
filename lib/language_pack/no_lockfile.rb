require "language_pack"
require "language_pack/base"

class LanguagePack::NoLockfile < LanguagePack::Base
  def self.use?
    p LanguagePack::ShellHelpers.env('BUNDLE_GEMFILE') || 'nix'
    !File.exists?("#{LanguagePack::ShellHelpers.env('BUNDLE_GEMFILE') || 'Gemfile'}.lock")
  end

  def name
    "Ruby/NoLockfile"
  end

  def compile
    error "Gemfile.lock required. Please check it in."
  end
end
