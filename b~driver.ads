pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 6.4.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_driver" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#5b0c06f0#;
   pragma Export (C, u00001, "driverB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#c2f6377e#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#c1a106e2#;
   pragma Export (C, u00005, "ada__text_ioB");
   u00006 : constant Version_32 := 16#dcf50d15#;
   pragma Export (C, u00006, "ada__text_ioS");
   u00007 : constant Version_32 := 16#c5483771#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#5389dfba#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#32a08138#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#465d427a#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#ac24596d#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#4c8a8c47#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#0f0cb66d#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#99c14e51#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#1f63cb3c#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#bc1fead0#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#6f0ee87a#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#5ac3ecce#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#4c9e814d#;
   pragma Export (C, u00026, "system__exceptions__machineS");
   u00027 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00027, "system__exceptions_debugB");
   u00028 : constant Version_32 := 16#4c2a78fc#;
   pragma Export (C, u00028, "system__exceptions_debugS");
   u00029 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00029, "system__img_intB");
   u00030 : constant Version_32 := 16#307b61fa#;
   pragma Export (C, u00030, "system__img_intS");
   u00031 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00031, "system__tracebackB");
   u00032 : constant Version_32 := 16#6c825ffc#;
   pragma Export (C, u00032, "system__tracebackS");
   u00033 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00033, "system__traceback_entriesB");
   u00034 : constant Version_32 := 16#32fb7748#;
   pragma Export (C, u00034, "system__traceback_entriesS");
   u00035 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00035, "system__traceback__symbolicB");
   u00036 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00036, "system__traceback__symbolicS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00039, "system__address_imageB");
   u00040 : constant Version_32 := 16#934c1c02#;
   pragma Export (C, u00040, "system__address_imageS");
   u00041 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00041, "system__wch_conB");
   u00042 : constant Version_32 := 16#29dda3ea#;
   pragma Export (C, u00042, "system__wch_conS");
   u00043 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00043, "system__wch_stwB");
   u00044 : constant Version_32 := 16#04cc8feb#;
   pragma Export (C, u00044, "system__wch_stwS");
   u00045 : constant Version_32 := 16#b96cfbef#;
   pragma Export (C, u00045, "system__wch_cnvB");
   u00046 : constant Version_32 := 16#266a1919#;
   pragma Export (C, u00046, "system__wch_cnvS");
   u00047 : constant Version_32 := 16#4be8ce1b#;
   pragma Export (C, u00047, "interfacesS");
   u00048 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00048, "system__wch_jisB");
   u00049 : constant Version_32 := 16#a61a0038#;
   pragma Export (C, u00049, "system__wch_jisS");
   u00050 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00050, "ada__streamsB");
   u00051 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00051, "ada__streamsS");
   u00052 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00052, "ada__io_exceptionsS");
   u00053 : constant Version_32 := 16#920eada5#;
   pragma Export (C, u00053, "ada__tagsB");
   u00054 : constant Version_32 := 16#13ca27f3#;
   pragma Export (C, u00054, "ada__tagsS");
   u00055 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00055, "system__htableB");
   u00056 : constant Version_32 := 16#b66232d2#;
   pragma Export (C, u00056, "system__htableS");
   u00057 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00057, "system__string_hashB");
   u00058 : constant Version_32 := 16#143c59ac#;
   pragma Export (C, u00058, "system__string_hashS");
   u00059 : constant Version_32 := 16#aff825f8#;
   pragma Export (C, u00059, "system__unsigned_typesS");
   u00060 : constant Version_32 := 16#06052bd0#;
   pragma Export (C, u00060, "system__val_lluB");
   u00061 : constant Version_32 := 16#d50a728a#;
   pragma Export (C, u00061, "system__val_lluS");
   u00062 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00062, "system__val_utilB");
   u00063 : constant Version_32 := 16#9e0037c6#;
   pragma Export (C, u00063, "system__val_utilS");
   u00064 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00064, "system__case_utilB");
   u00065 : constant Version_32 := 16#16a9e8ef#;
   pragma Export (C, u00065, "system__case_utilS");
   u00066 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00066, "interfaces__c_streamsB");
   u00067 : constant Version_32 := 16#a06e9ee4#;
   pragma Export (C, u00067, "interfaces__c_streamsS");
   u00068 : constant Version_32 := 16#42315736#;
   pragma Export (C, u00068, "system__crtlS");
   u00069 : constant Version_32 := 16#f1dc49a7#;
   pragma Export (C, u00069, "system__file_ioB");
   u00070 : constant Version_32 := 16#95d1605d#;
   pragma Export (C, u00070, "system__file_ioS");
   u00071 : constant Version_32 := 16#cf417de3#;
   pragma Export (C, u00071, "ada__finalizationS");
   u00072 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00072, "system__finalization_rootB");
   u00073 : constant Version_32 := 16#7d52f2a8#;
   pragma Export (C, u00073, "system__finalization_rootS");
   u00074 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00074, "interfaces__cB");
   u00075 : constant Version_32 := 16#61e3d2ff#;
   pragma Export (C, u00075, "interfaces__cS");
   u00076 : constant Version_32 := 16#e8f56352#;
   pragma Export (C, u00076, "system__os_libB");
   u00077 : constant Version_32 := 16#dc0cac3f#;
   pragma Export (C, u00077, "system__os_libS");
   u00078 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00078, "system__stringsB");
   u00079 : constant Version_32 := 16#4c1f905e#;
   pragma Export (C, u00079, "system__stringsS");
   u00080 : constant Version_32 := 16#cf3f1b90#;
   pragma Export (C, u00080, "system__file_control_blockS");
   u00081 : constant Version_32 := 16#7fa19988#;
   pragma Export (C, u00081, "binarysearchtreeB");
   u00082 : constant Version_32 := 16#4b091150#;
   pragma Export (C, u00082, "binarysearchtreeS");
   u00083 : constant Version_32 := 16#0a3499e8#;
   pragma Export (C, u00083, "gstackB");
   u00084 : constant Version_32 := 16#86eb8965#;
   pragma Export (C, u00084, "gstackS");
   u00085 : constant Version_32 := 16#5b9edcc4#;
   pragma Export (C, u00085, "system__compare_array_unsigned_8B");
   u00086 : constant Version_32 := 16#9ba3f0b5#;
   pragma Export (C, u00086, "system__compare_array_unsigned_8S");
   u00087 : constant Version_32 := 16#5f72f755#;
   pragma Export (C, u00087, "system__address_operationsB");
   u00088 : constant Version_32 := 16#21ac3f0b#;
   pragma Export (C, u00088, "system__address_operationsS");
   u00089 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00089, "system__concat_2B");
   u00090 : constant Version_32 := 16#300056e8#;
   pragma Export (C, u00090, "system__concat_2S");
   u00091 : constant Version_32 := 16#58e7cff7#;
   pragma Export (C, u00091, "system__memoryB");
   u00092 : constant Version_32 := 16#6bdde70c#;
   pragma Export (C, u00092, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  binarysearchtree%s
   --  driver%b
   --  gstack%s
   --  gstack%b
   --  binarysearchtree%b
   --  END ELABORATION ORDER


end ada_main;
