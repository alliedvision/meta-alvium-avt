#Von: meta-xilinx@lists.yoctoproject.org <meta-xilinx@lists.yoctoproject.org> im Auftrag von Mark Hatle <mark.hatle@kernel.crashing.org>
#Gesendet: Dienstag, 17. Mai 2022 18:14
#An: meta-xilinx@lists.yoctoproject.org
#Betreff: [External] Re: [meta-xilinx] [PATCH] xilinx-bootbin: add task depend on virtual/bitstream:do_deploy
# 
#We found this same bug yesterday.  The issue is that bitstream only has a
#do_deploy, but a while back we changed everything to work off of RECIPE_SYSROOTs.
#
#I don't yet have a fix for the issue, but I'm expecting it will be to package
#the bitstream in a target recipe, and then use the RECIPE_SYSROOT instead of the
#DEPLOY directory, this should also allow users to regenerate the bootbin images
#on the target if needed.
#
#The next step is to also take the produced bif file (from the bootbin recipe)
#and write that as a target recipe as well.
#
#I've not yet figured out all of the exact details, but what you have is a
#reasonable workaround until then.  Hopefully I can get this fixed in a day or
#two.  (Your other option is don't use a bitstream within the bootbin.  It may or
#may not be required depending on the board.)
#
#--Mark
#
#On 5/16/22 5:58 PM, Jeremy Puhlman wrote:
#> 2022.05.12-19:32:26 bitbake-populate_sdk|Exception: FileNotFoundError: [Errno
#> 2] No such file or directory:
#> '/opt/build/000000000000-0512.1128/tmp/deploy/images/zynqmp-generic/download-zynqmp-generic.bit'
#> 
#> DEPENDS isn't sufficent here. If you are not using BB_SCHEDULER set to "completion", as is
#> default for rm_work, something that depends on a DEPEND can start after populate_sysroot.
#> However xilinx-bootbin depends on the completion of do_deploy.
#> 
#> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
#> ---
#>   meta-xilinx-core/recipes-bsp/bootbin/xilinx-bootbin_1.0.bb | 2 ++
#>   1 file changed, 2 insertions(+)
#> 
#> diff --git a/meta-xilinx-core/recipes-bsp/bootbin/xilinx-bootbin_1.0.bb b/meta-xilinx-core/recipes-bsp/bootbin/xilinx-bootbin_1.0.bb
#> index f914675e..9f24372e 100644
#> --- a/meta-xilinx-core/recipes-bsp/bootbin/xilinx-bootbin_1.0.bb
#> +++ b/meta-xilinx-core/recipes-bsp/bootbin/xilinx-bootbin_1.0.bb
#> @@ -16,6 +16,8 @@ DEPENDS += "bootgen-native"
#>   # There is no bitstream recipe, so really depend on virtual/bitstream
#>   DEPENDS += "${@(d.getVar('BIF_PARTITION_ATTR') or "").replace('bitstream', 'virtual/bitstream')}"
#>   

#do_build[depends] += "${@bb.utils.contains('DEPENDS', 'bitstream', 'virtual/bitstream:do_deploy', '', d)}"
do_fetch[depends] += "virtual/bitstream:do_deploy"
