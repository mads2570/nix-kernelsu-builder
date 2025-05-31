_: {
  perSystem =
    { pkgs, ... }:
    let
      sources = pkgs.callPackage _sources/generated.nix { };
    in
    {
      kernelsu = {
        samsung-a42xq = {
          anyKernelVariant = "osm0sis";
          kernelSU.enable = true;
          kernelDefconfigs = [ "a42xq_eur_open_defconfig" ];
          kernelImageName = "Image.gz-dtb";
          kernelMakeFlags = [
            "KCFLAGS=\"-w\""
            "KCPPFLAGS=\"-w\""
          ];
          kernelSrc = https://github.com/mads2570/a42-kernel.git;
          oemBootImg = https://github.com/mads2570/a42xq_boot.img/raw/master/boot.img;
        };

        moto-rtwo-lineageos-21 = {
          anyKernelVariant = "kernelsu";
          clangVersion = "latest";

          kernelSU.variant = "next";
          susfs = {
            enable = true;
            inherit (sources.susfs-android13-5_15) src;
            kernelsuPatch = "${sources.wildplus-kernel-patches.src}/next/0001-kernel-patch-susfs-v1.5.5-to-KernelSU-Next-v1.0.5.patch";
          };

          kernelDefconfigs = [
            "gki_defconfig"
            "ranchu64_defconfig"
            "defconfig"
            "vendor/a42xq_eur_open_defconfig"
            
          ];
          kernelImageName = "Image";
          kernelMakeFlags = [
            "KCFLAGS=\"-w\""
            "KCPPFLAGS=\"-w\""
          ];
          kernelPatches = [
            "${sources.wildplus-kernel-patches.src}/69_hide_stuff.patch"
          ];
          kernelSrc = https://github.com/mads2570/a42-kernel.git;
        };

        moto-rtwo-lineageos-22_1 = {
          anyKernelVariant = "kernelsu";
          clangVersion = "latest";

          kernelSU.variant = "next";
          susfs = {
            enable = true;
            inherit (sources.susfs-android13-5_15) src;
            kernelsuPatch = "${sources.wildplus-kernel-patches.src}/next/0001-kernel-patch-susfs-v1.5.5-to-KernelSU-Next-v1.0.5.patch";
          };

          kernelDefconfigs = [
            "gki_defconfig"
            "vendor/a42xq_eur_open_defconfig"

          ];
          kernelImageName = "Image";
          kernelMakeFlags = [
            "KCFLAGS=\"-w\""
            "KCPPFLAGS=\"-w\""
          ];
          kernelPatches = [
            "${sources.wildplus-kernel-patches.src}/69_hide_stuff.patch"
          ];
          kernelSrc = https://github.com/mads2570/a42-kernel.git;
        };

        oneplus-8t-blu-spark = {
          anyKernelVariant = "osm0sis";
          clangVersion = "latest";
          kernelSU.variant = "next";
          kernelDefconfigs = [ "a42xq_eur_open_defconfig" ];
          kernelImageName = "Image";
          kernelSrc = https://github.com/mads2570/a42-kernel.git;
        };
      };
    };
}
