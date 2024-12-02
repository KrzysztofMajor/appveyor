find_path(ENTT_INCLUDE_DIR NAMES entt/entt.hpp PATH_SUFFIXES include)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(EnTT DEFAULT_MSG ENTT_INCLUDE_DIR)

add_library(EnTT::EnTT UNKNOWN IMPORTED)
set_target_properties(EnTT::EnTT PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${ENTT_INCLUDE_DIR}")
set_property(TARGET EnTT::EnTT APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_property(TARGET EnTT::EnTT APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)