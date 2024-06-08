{
  description = "My custom  nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nix-systems.url = "github:nix-systems/default";
    rust-overlay.url = "github:oxalica/rust-overlay";
    dirStack = {
      url = "github:NewDawn0/dirStack";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    gen = {
      url = "github:NewDawn0/gen";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    nixie-clock = {
      url = "github:NewDawn0/nixie-clock";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    note = {
      url = "github:NewDawn0/note";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
    };
    notify = {
      url = "github:NewDawn0/notify";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
    };
    rgpt = {
      url = "github:NewDawn0/rgpt";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    shell-utils = {
      url = "github:NewDawn0/shell-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
    };
    translate = {
      url = "github:NewDawn0/tl";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    mac-apps-archive = {
      url = "github:NewDawn0/mac-apps-archive";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homebrew-manager = {
      url = "github:NewDawn0/homebrew-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vocab = {
      url = "github:NewDawn0/vocab";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let eachSystem = nixpkgs.lib.genAttrs (import inputs.nix-systems);
    in {
      overlays.default = (final: prev: {
        ansi = self.packages.${prev.system}.ansi;
        dirStack = self.packages.${prev.system}.dirStack;
        ex = self.packages.${prev.system}.ex;
        gen = self.packages.${prev.system}.gen;
        homebrew-manager = self.packages.${prev.system}.homebrew-manager;
        mac-apps-archive = self.packages.${prev.system}.mac-apps-archive;
        nixie-clock = self.packages.${prev.system}.nixie-clock;
        note = self.packages.${prev.system}.note;
        notify = self.packages.${prev.system}.notify;
        rgpt = self.packages.${prev.system}.rgpt;
        translate = self.packages.${prev.system}.translate;
        up = self.packages.${prev.system}.up;
        vocab = self.packages.${prev.system}.vocab;
      });
      packages = eachSystem (system: {
        ansi = inputs.shell-utils.packages.${system}.ansi;
        dirStack = inputs.dirStack.packages.${system}.default;
        ex = inputs.shell-utils.packages.${system}.ex;
        gen = inputs.gen.packages.${system}.default;
        homebrew-manager = inputs.homebrew-manager.packages.${system}.default;
        mac-apps-archive = inputs.mac-apps-archive.packages.${system}.default;
        nixie-clock = inputs.nixie-clock.packages.${system}.default;
        note = inputs.note.packages.${system}.default;
        notify = inputs.notify.packages.${system}.default;
        rgpt = inputs.rgpt.packages.${system}.default;
        translate = inputs.translate.packages.${system}.default;
        up = inputs.shell-utils.packages.${system}.up;
        vocab = inputs.vocab.packages.${system}.default;
      });
    };
}
