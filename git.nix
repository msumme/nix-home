{ git_name, git_email }: {
  enable = true;
  userName = git_name;
  userEmail = git_email;
  lfs = { enable = true; };
  ignores = [ "*~" "*.sw?" ".[#]*" "[#]*" "flycheck_*" ];
  extraConfig = {
    pull = { rebase = true; };
    rebase = {
      autoSquash = true;
      autoStash = true;
    };
    alias = {

      st = "status";
      ci = "commit --verbose";
      cm = "commit -m";
      can = "commit --amend --no-edit";
      cann = "commit --amend --no-edit --no-verify";
      co = "checkout";
      cob = "checkout -b";
      di = "diff --find-copies-harder";
      dc = "diff --find-copies-harder --cached";
      amend = "commit --amend";
      aa = "add --all";
      ff = "merge --ff-only";
      noff = "merge --no-ff";
      fa = "fetch --all";
      pom = "push origin master";
      ds = "diff --stat=160,120";
      dh1 = "diff HEAD~1";
      remaster = "!git stash && git checkout master && git pull && git checkout - && git rebase master && git stash pop";
      pn = "!git push --set-upstream origin $(git branch --show-current)";
      pr = "! gh pr create -w";

      # Divergence (commits we added and commits remote added)
      div = "divergence";

      # Goodness (summary of diff lines added/removed/total)
      gn = "goodness";
      gnc = "goodness --cached";

      # Fancy logging.
      #   h = head
      #   hp = head with patch
      #   r = recent commits, only current branch
      #   ra = recent commits, all reachable refs
      #   l = all commits, only current branch
      #   la = all commits, all reachable refs
      #   b = all branches
      #   bs = all branches, sorted by last commit date
      head = "!git r -1";
      h = "!git head";
      hp = "!. ~/.githelpers && show_git_head";
      r = "!GIT_NO_PAGER=1 git l -30";
      ra = "!git r --all";
      l = "!. ~/.githelpers && pretty_git_log";
      la = "!git l --all";
      b = "!. ~/.githelpers && pretty_git_branch";
      bs = "!. ~/.githelpers && pretty_git_branch_sorted";
      ski = "!git stash --keep-index";
      cp = "cherry-pick";
      pf = "push --force-with-lease";

    };
    # core = { pager = "diff-so-fancy | less --tabs=4 -RFX"; };
    color = { ui = "auto"; };
    "color \"diff-highlight\"" = {
      oldNormal = "red";
      oldHighlight = ''red #500000'';
      newNormal = "green";
      newHighlight = ''green #003000'';
    };
    "color \"diff\"" = {
      meta = 11;
      frag = "magenta bold";
      commit = "yellow bold";
      old = "red";
      new = "green";
      whitespace = ''#ffff00 reverse'';
    };
    merge = { tool = "vimdiff"; };
    "diff-so-fancy" = {
      stripLeadingSymbols = false;
      markEmptyLines = false;
    };
  };
}
