/* 
 *     Copyright (c) 2017-2018, NVIDIA CORPORATION.  All rights reserved.
 *
 * NVIDIA CORPORATION and its licensors retain all intellectual property
 * and proprietary rights in and to this software, related documentation
 * and any modifications thereto.  Any use, reproduction, disclosure or
 * distribution of this software and related documentation without an express
 * license agreement from NVIDIA CORPORATION is strictly prohibited.
 *
 */

SECTIONS{
       /DISCARD/ :{*(.IP*INFO)}
       .text : {
          __pgi_trace = .;
          *(.pgi_trace)
          __pgi_tracee = .;
       }
       .data1          :
       {
            __pgi_data_section_start = LOADADDR(.data);
            __pgi_bss_section_start = LOADADDR(.bss);
            __pgi_rodata_section_start = LOADADDR(.rodata);
       }
    } 
