# Nix custom pkgs
A collection of my custom nix apps for linux/macOS

## Installation
### Imperatively
```bash
git clone https://github.com/NewDawn0/nix-custom-pkgs
nix profile install .
```
### Declaratively
1. Add it as an input to your system flake as follows
    ```nix
    {
      inputs = {
        # Your other inputs ...
        nix-custom-pkgs = {
          url = "github:NewDawn0/nix-custom-pkgs";
          inputs.nixpkgs.follows = "nixpkgs";
          # Optional: If you use nix-systems or rust-overlay
          inputs.nix-systems.follows = "nix-systems";
        };
      };
    }
    ```
2. Add this to your overlays to expose shell-utils to your pkgs
    ```nix
    (final: prev: {
      ansi = inputs.nix-custom-pkgs.packages.${prev.system}.ansi;
      dirStack = inputs.nix-custom-pkgs.packages.${prev.system}.dirStack;
      ex = inputs.nix-custom-pkgs.packages.${prev.system}.ex;
      gen = inputs.nix-custom-pkgs.packages.${prev.system}.ex;
      mac-apps-archive = inputs.nix-custom-pkgs.packages.${prev.system}.mac-apps-archive;
      nixie-clock = inputs.nix-custom-pkgs.packages.${prev.system}.nixie-clock;
      note = inputs.nix-custom-pkgs.packages.${prev.system}.note;
      notify = inputs.nix-custom-pkgs.packages.${prev.system}.notify;
      rgpt = inputs.nix-custom-pkgs.packages.${prev.system}.rgpt;
      translate = inputs.nix-custom-pkgs.packages.${prev.system}.translate;
      up = inputs.nix-custom-pkgs.packages.${prev.system}.up;
      homebrew-manager = inputs.nix-custom-pkgs.packages.${prev.system}.homebrew-manager;
    })
    ```
3. Then you can either install it in your `environment.systemPackages` using 
    ```nix
    environment.systemPackages = with pkgs; [ 
      ansi
      dirStack
      ex
      gen
      mac-apps-archive
      nixie-clock
      note
      notify
      rgpt
      translate
      up
      homebrew-manager
    ];
    ```
    or install it to your `home.packages`
    ```nix
    home.packages = with pkgs; [
      ansi
      dirStack
      ex
      gen
      mac-apps-archive
      nixie-clock
      note
      notify
      rgpt
      translate
      up
      homebrew-manager
    ];
    ```
**Note**: You are able to install the packages individually aswell by going to the individual repos
**Note**: If you use up don't forget to initalize it using the install instructions in `./up/README.md`
