include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(__default_library_list )

set(OUTPUT_SUFFIX elf)
# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(__default_default_XC8_FILE_TYPE_assemble)
add_library(A___default_default_XC8_assemble OBJECT ${__default_default_XC8_FILE_TYPE_assemble})
    A___default_default_XC8_assemble_rule(A___default_default_XC8_assemble)
    list(APPEND __default_library_list "$<TARGET_OBJECTS:A___default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(__default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(A___default_default_XC8_assemblePreprocess OBJECT ${__default_default_XC8_FILE_TYPE_assemblePreprocess})
    A___default_default_XC8_assemblePreprocess_rule(A___default_default_XC8_assemblePreprocess)
    list(APPEND __default_library_list "$<TARGET_OBJECTS:A___default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(__default_default_XC8_FILE_TYPE_compile)
add_library(A___default_default_XC8_compile OBJECT ${__default_default_XC8_FILE_TYPE_compile})
    A___default_default_XC8_compile_rule(A___default_default_XC8_compile)
    list(APPEND __default_library_list "$<TARGET_OBJECTS:A___default_default_XC8_compile>")

endif()

# Handle files with suffix elf, for group default-XC8
if(__default_default_XC8_FILE_TYPE_objcopy_avr)
add_library(A___default_default_XC8_objcopy_avr OBJECT ${__default_default_XC8_FILE_TYPE_objcopy_avr})
    A___default_default_XC8_objcopy_avr_rule(A___default_default_XC8_objcopy_avr)
    list(APPEND __default_library_list "$<TARGET_OBJECTS:A___default_default_XC8_objcopy_avr>")

endif()


# Main target for this project
add_executable(__default_image_qNxyfhD_ ${__default_library_list})

set_target_properties(__default_image_qNxyfhD_ PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${__default_output_dir}")
target_link_libraries(__default_image_qNxyfhD_ PRIVATE ${__default_default_XC8_FILE_TYPE_link})
# Add the link options from the rule file.
A___default_link_rule( __default_image_qNxyfhD_)


#Add objcopy steps
A___default_objcopy_avr_rule(__default_image_qNxyfhD_)
add_custom_target(
    merge_loadable_files ALL
    COMMAND "/home/jon/.mplab/app-finder/apps/hexmate/v3.00/dist/linux/bin/hexmate"  /home/jon/Projects/Programming/Embedded/selve_valgte_opgave/main.hex ${CMAKE_CURRENT_SOURCE_DIR}/../../out/default.hex  -O${CMAKE_CURRENT_SOURCE_DIR}/../../out/default-unified.hex
    BYPRODUCTS ${CMAKE_CURRENT_SOURCE_DIR}/../../out/default-unified.hex
    COMMENT "Merging loadable hex files into unified image")
add_dependencies(merge_loadable_files __default_image_qNxyfhD_)

