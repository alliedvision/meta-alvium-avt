# meta-alvium-avt

This layer provides support for Alvium MIPI-CSI2 cameras.


## Compatibility
This release is tested with:
- i.MX 8M Plus EVK with i.MX Yocto Project BSP Rev. 5.15.72-2.2.0
- AMD Xilinx ZCU106 Evaluation Kit with Xilinx Yocto 2023.1
- AMD Xilinx Kria KV260 Vision AI with Xilinx Yocto 2023.1

## Getting started
For getting started please use one of the reference image manifest repositories:
- i.MX 8M Plus EVK: [alvium-manifest-imx8mpevk](https://github.com/alliedvision/alvium-manifest-imx8mpevk)
- AMD Xilinx ZCU106: [alvium-manifest-zcu106](https://github.com/alliedvision/alvium-manifest-zcu106)
- AMD Xilinx Kria KV260: [alvium-manifest-kv260](https://github.com/alliedvision/alvium-manifest-kv260)

## Maintainers, Mailing list, Patches

For any patches or pull requests please use the Github pull requests.
For comments or questions about this layer, please create an issue or contact support@alliedvision.com.


Maintainers:

	Dennis Langenkamp

## Dependencies

This layer depends on:
 - meta-oe
 - meta-poky
 - meta-qt5 (optional, for v4l2viewer with Qt5)
 - meta-qt6 (optional, for v4l2viewer with Qt6)

# Beta Disclaimer

Please be aware that all code revisions not explicitly listed in the Github Release section are
considered a **Beta Version**.

For Beta Versions, the following applies in addition to the BSD 3-Clause License:

THE SOFTWARE IS PRELIMINARY AND STILL IN TESTING AND VERIFICATION PHASE AND IS PROVIDED ON AN “AS
IS” AND “AS AVAILABLE” BASIS AND IS BELIEVED TO CONTAIN DEFECTS. THE PRIMARY PURPOSE OF THIS EARLY
ACCESS IS TO OBTAIN FEEDBACK ON PERFORMANCE AND THE IDENTIFICATION OF DEFECTS IN THE SOFTWARE,
HARDWARE AND DOCUMENTATION.
