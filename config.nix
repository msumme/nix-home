{ pkgs, ... }:
{
  allowUnfreePredicate = (pkg: builtins.elem (builtins.parseDrvName pkg.name).name [
    "ruby-mine"
  ]);
}
