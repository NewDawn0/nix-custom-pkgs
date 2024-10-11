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
         inputs.rust-overlay.follows = "rust-overlay";
       };
     };
   }
   ```

2. Add the overlay to expose shell-utils to your pkgs

   ```nix
   overlays = [ input.nix-custom-pkgs.overlays.default ];
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
        vocab
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
    vocab
];
`
**Note**: You are able to install the packages individually aswell by going to the individual repos
**Note**: If you use up don't forget to initalize it using the install instructions in `./up/README.md`
```
