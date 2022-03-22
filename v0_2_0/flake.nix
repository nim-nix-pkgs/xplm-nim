{
  description = ''X-Plane XPLM SDK wrapper'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-XPLM-Nim-v0_2_0.flake = false;
  inputs.src-XPLM-Nim-v0_2_0.owner = "jpoirier";
  inputs.src-XPLM-Nim-v0_2_0.ref   = "v0_2_0";
  inputs.src-XPLM-Nim-v0_2_0.repo  = "XPLM-Nim";
  inputs.src-XPLM-Nim-v0_2_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-XPLM-Nim-v0_2_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-XPLM-Nim-v0_2_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}