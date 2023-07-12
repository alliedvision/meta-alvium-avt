meta-alvium-avt
=================

This layer provides support for Alvium MIPI-CSI2 cameras on NXP i.MX8MP and Xilinx ZynqMP.

THE SOFTWARE IS PRELIMINARY AND STILL IN TESTING AND VERIFICATION PHASE AND IS PROVIDED ON AN “AS IS” AND “AS AVAILABLE” BASIS AND IS BELIEVED TO CONTAIN DEFECTS. A PRIMARY PURPOSE OF THIS EARLY ACCESS IS TO OBTAIN FEEDBACK ON PERFORMANCE AND THE IDENTIFICATION OF DEFECT SOFTWARE, HARDWARE AND DOCUMENTATION.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Maintainers, Mailing list, Patches
==================================

For any patches or pull requests please use the Github pull requests.
For comments or questions about this layer, please create an issue or contact support@alliedvision.com.


Maintainers:

	Dennis Langenkamp 
	Florian Kesseler 

Dependencies
============

This layer depends on:
 - meta-oe
 - meta-poky
 - meta-multimedia
 - meta-python
 - meta-gnome
 - meta-networking
 - meta-filesystems
 - meta-qt5 (need to migrate to qt6)
 - meta-python2

 - Layers from NXP:
	- meta-freescale
	- meta-freescale-3rdparty
	- meta-freescale-distro
	- meta-bsp
	- meta-sdk
	- meta-ml
	- meta-v2x


 - Layers from Xilinx:
	- meta-xilinx
	- meta-xilinx-bsp
	- meta-xilinx-tools
	- meta-bsp

Layer dependencies
=====================

URI: git://git.openembedded.org/bitbake

URI: git://git.openembedded.org/openembedded-core

URI: https://git.openembedded.org/meta-openembedded
  meta-openembedded/meta-oe \
  meta-openembedded/meta-multimedia \
  meta-openembedded/meta-python \

URI: git://github.com/meta-qt5/meta-qt5.git
