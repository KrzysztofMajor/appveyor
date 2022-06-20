message("Hello from OpenSSL")

find_path(OPENSSL_INCLUDE_DIR NAMES openssl/ssl.h PATH_SUFFIXES include)

find_library(OPENSSL_CRYPTO_RELEASE_LIBRARY NAMES libcrypto-1_1.lib libcrypto-1_1-x64.lib)
find_library(OPENSSL_CRYPTO_DEBUG_LIBRARY NAMES libcrypto-1_1d.lib libcrypto-1_1-x64d.lib)

find_library(OPENSSL_SSL_RELEASE_LIBRARY NAMES libssl-1_1.lib libssl-1_1-x64.lib)
find_library(OPENSSL_SSL_DEBUG_LIBRARY NAMES libssl-1_1d.lib libssl-1_1-x64d.lib)

set(OPENSSL_CRYPTO_LIBRARY optimized ${OPENSSL_CRYPTO_RELEASE_LIBRARY} debug ${OPENSSL_CRYPTO_DEBUG_LIBRARY})
set(OPENSSL_SSL_LIBRARY optimized ${OPENSSL_SSL_RELEASE_LIBRARY} debug ${OPENSSL_SSL_DEBUG_LIBRARY})

set(OPENSSL_SSL_LIBRARIES ${OPENSSL_SSL_LIBRARY})
set(OPENSSL_CRYPTO_LIBRARIES ${OPENSSL_CRYPTO_LIBRARY})
set(OPENSSL_LIBRARIES ${OPENSSL_SSL_LIBRARIES} ${OPENSSL_CRYPTO_LIBRARIES} )

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(OpenSSL DEFAULT_MSG OPENSSL_LIBRARIES OPENSSL_SSL_LIBRARIES OPENSSL_CRYPTO_LIBRARIES OPENSSL_INCLUDE_DIR OPENSSL_USE_STATIC_LIBS)

mark_as_advanced(OPENSSL_USE_STATIC_LIBS)
mark_as_advanced(OPENSSL_LIBRARIES OPENSSL_SSL_LIBRARIES OPENSSL_CRYPTO_LIBRARIES)
mark_as_advanced(OPENSSL_CRYPTO_LIBRARY OPENSSL_CRYPTO_DEBUG_LIBRARY)

add_library(OpenSSL::Crypto UNKNOWN IMPORTED)
set_target_properties(OpenSSL::Crypto PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${OPENSSL_INCLUDE_DIR}")
set_target_properties(OpenSSL::Crypto PROPERTIES IMPORTED_LINK_INTERFACE_LANGUAGES "C" IMPORTED_LOCATION "${OPENSSL_CRYPTO_LIBRARY}")
set_property(TARGET OpenSSL::Crypto APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(OpenSSL::Crypto PROPERTIES IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C" IMPORTED_LOCATION_RELEASE "${OPENSSL_CRYPTO_RELEASE_LIBRARY}")
set_property(TARGET OpenSSL::Crypto APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(OpenSSL::Crypto PROPERTIES IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C" IMPORTED_LOCATION_DEBUG "${OPENSSL_CRYPTO_DEBUG_LIBRARY}")

add_library(OpenSSL::SSL UNKNOWN IMPORTED)
set_target_properties(OpenSSL::SSL PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${OPENSSL_INCLUDE_DIR}")