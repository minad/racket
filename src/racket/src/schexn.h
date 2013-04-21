/* This file was generated by makeexn */
#ifndef _MZEXN_DEFINES
#define _MZEXN_DEFINES
enum {
  MZEXN,
  MZEXN_FAIL,
  MZEXN_FAIL_CONTRACT,
  MZEXN_FAIL_CONTRACT_ARITY,
  MZEXN_FAIL_CONTRACT_DIVIDE_BY_ZERO,
  MZEXN_FAIL_CONTRACT_NON_FIXNUM_RESULT,
  MZEXN_FAIL_CONTRACT_CONTINUATION,
  MZEXN_FAIL_CONTRACT_VARIABLE,
  MZEXN_FAIL_SYNTAX,
  MZEXN_FAIL_SYNTAX_UNBOUND,
  MZEXN_FAIL_SYNTAX_MISSING_MODULE,
  MZEXN_FAIL_READ,
  MZEXN_FAIL_READ_EOF,
  MZEXN_FAIL_READ_NON_CHAR,
  MZEXN_FAIL_FILESYSTEM,
  MZEXN_FAIL_FILESYSTEM_EXISTS,
  MZEXN_FAIL_FILESYSTEM_VERSION,
  MZEXN_FAIL_FILESYSTEM_ERRNO,
  MZEXN_FAIL_FILESYSTEM_MISSING_MODULE,
  MZEXN_FAIL_NETWORK,
  MZEXN_FAIL_NETWORK_ERRNO,
  MZEXN_FAIL_OUT_OF_MEMORY,
  MZEXN_FAIL_UNSUPPORTED,
  MZEXN_FAIL_USER,
  MZEXN_BREAK,
  MZEXN_BREAK_HANG_UP,
  MZEXN_BREAK_TERMINATE,
  MZEXN_OTHER
};
#endif

#ifdef _MZEXN_TABLE

#define MZEXN_MAXARGS 4

#ifdef GLOBAL_EXN_ARRAY
static exn_rec exn_table[] = {
  { 2, NULL, NULL, 0, NULL, -1 },
  { 2, NULL, NULL, 0, NULL, 0 },
  { 2, NULL, NULL, 0, NULL, 1 },
  { 2, NULL, NULL, 0, NULL, 2 },
  { 2, NULL, NULL, 0, NULL, 2 },
  { 2, NULL, NULL, 0, NULL, 2 },
  { 2, NULL, NULL, 0, NULL, 2 },
  { 3, NULL, NULL, 0, NULL, 2 },
  { 3, NULL, NULL, 0, NULL, 1 },
  { 3, NULL, NULL, 0, NULL, 8 },
  { 4, NULL, NULL, 0, NULL, 8 },
  { 3, NULL, NULL, 0, NULL, 1 },
  { 3, NULL, NULL, 0, NULL, 11 },
  { 3, NULL, NULL, 0, NULL, 11 },
  { 2, NULL, NULL, 0, NULL, 1 },
  { 2, NULL, NULL, 0, NULL, 14 },
  { 2, NULL, NULL, 0, NULL, 14 },
  { 3, NULL, NULL, 0, NULL, 14 },
  { 3, NULL, NULL, 0, NULL, 14 },
  { 2, NULL, NULL, 0, NULL, 1 },
  { 3, NULL, NULL, 0, NULL, 19 },
  { 2, NULL, NULL, 0, NULL, 1 },
  { 2, NULL, NULL, 0, NULL, 1 },
  { 2, NULL, NULL, 0, NULL, 1 },
  { 3, NULL, NULL, 0, NULL, 0 },
  { 3, NULL, NULL, 0, NULL, 24 },
  { 3, NULL, NULL, 0, NULL, 24 }
};
#else
static exn_rec *exn_table;
#endif

#endif

#ifdef _MZEXN_PRESETUP

#ifndef GLOBAL_EXN_ARRAY
  exn_table = (exn_rec *)scheme_malloc(sizeof(exn_rec) * MZEXN_OTHER);
  exn_table[MZEXN].args = 2;
  exn_table[MZEXN_FAIL].args = 2;
  exn_table[MZEXN_FAIL_CONTRACT].args = 2;
  exn_table[MZEXN_FAIL_CONTRACT_ARITY].args = 2;
  exn_table[MZEXN_FAIL_CONTRACT_DIVIDE_BY_ZERO].args = 2;
  exn_table[MZEXN_FAIL_CONTRACT_NON_FIXNUM_RESULT].args = 2;
  exn_table[MZEXN_FAIL_CONTRACT_CONTINUATION].args = 2;
  exn_table[MZEXN_FAIL_CONTRACT_VARIABLE].args = 3;
  exn_table[MZEXN_FAIL_SYNTAX].args = 3;
  exn_table[MZEXN_FAIL_SYNTAX_UNBOUND].args = 3;
  exn_table[MZEXN_FAIL_SYNTAX_MISSING_MODULE].args = 4;
  exn_table[MZEXN_FAIL_READ].args = 3;
  exn_table[MZEXN_FAIL_READ_EOF].args = 3;
  exn_table[MZEXN_FAIL_READ_NON_CHAR].args = 3;
  exn_table[MZEXN_FAIL_FILESYSTEM].args = 2;
  exn_table[MZEXN_FAIL_FILESYSTEM_EXISTS].args = 2;
  exn_table[MZEXN_FAIL_FILESYSTEM_VERSION].args = 2;
  exn_table[MZEXN_FAIL_FILESYSTEM_ERRNO].args = 3;
  exn_table[MZEXN_FAIL_FILESYSTEM_MISSING_MODULE].args = 3;
  exn_table[MZEXN_FAIL_NETWORK].args = 2;
  exn_table[MZEXN_FAIL_NETWORK_ERRNO].args = 3;
  exn_table[MZEXN_FAIL_OUT_OF_MEMORY].args = 2;
  exn_table[MZEXN_FAIL_UNSUPPORTED].args = 2;
  exn_table[MZEXN_FAIL_USER].args = 2;
  exn_table[MZEXN_BREAK].args = 3;
  exn_table[MZEXN_BREAK_HANG_UP].args = 3;
  exn_table[MZEXN_BREAK_TERMINATE].args = 3;
#endif

#endif

#ifdef _MZEXN_DECL_FIELDS
  static const char *MZEXN_FIELDS[2] = { "message", "continuation-marks" };
  static const char *MZEXN_FAIL_CONTRACT_VARIABLE_FIELDS[1] = { "id" };
  static const char *MZEXN_FAIL_SYNTAX_FIELDS[1] = { "exprs" };
  static const char *MZEXN_FAIL_SYNTAX_MISSING_MODULE_FIELDS[1] = { "path" };
  static const char *MZEXN_FAIL_READ_FIELDS[1] = { "srclocs" };
  static const char *MZEXN_FAIL_FILESYSTEM_ERRNO_FIELDS[1] = { "errno" };
  static const char *MZEXN_FAIL_FILESYSTEM_MISSING_MODULE_FIELDS[1] = { "-path" };
  static const char *MZEXN_FAIL_NETWORK_ERRNO_FIELDS[1] = { "errno" };
  static const char *MZEXN_BREAK_FIELDS[1] = { "continuation" };
#endif

#ifdef _MZEXN_DECL_PROPS
#  define MZEXN_FAIL_SYNTAX_PROPS scheme_make_pair(scheme_make_pair(scheme_source_property, scheme_make_prim(extract_syntax_locations)), scheme_null)
#  define MZEXN_FAIL_SYNTAX_MISSING_MODULE_PROPS scheme_make_pair(scheme_make_pair(scheme_module_path_property, scheme_make_prim(extract_module_path_3)), scheme_null)
#  define MZEXN_FAIL_READ_PROPS scheme_make_pair(scheme_make_pair(scheme_source_property, scheme_make_prim(extract_read_locations)), scheme_null)
#  define MZEXN_FAIL_FILESYSTEM_MISSING_MODULE_PROPS scheme_make_pair(scheme_make_pair(scheme_module_path_property, scheme_make_prim(extract_module_path_2)), scheme_null)
#endif

#ifdef _MZEXN_SETUP
  SETUP_STRUCT(MZEXN, NULL, "exn", 2, MZEXN_FIELDS, scheme_null, scheme_make_prim(exn_field_check))
  SETUP_STRUCT(MZEXN_FAIL, EXN_PARENT(MZEXN), "exn:fail", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_CONTRACT, EXN_PARENT(MZEXN_FAIL), "exn:fail:contract", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_CONTRACT_ARITY, EXN_PARENT(MZEXN_FAIL_CONTRACT), "exn:fail:contract:arity", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_CONTRACT_DIVIDE_BY_ZERO, EXN_PARENT(MZEXN_FAIL_CONTRACT), "exn:fail:contract:divide-by-zero", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_CONTRACT_NON_FIXNUM_RESULT, EXN_PARENT(MZEXN_FAIL_CONTRACT), "exn:fail:contract:non-fixnum-result", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_CONTRACT_CONTINUATION, EXN_PARENT(MZEXN_FAIL_CONTRACT), "exn:fail:contract:continuation", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_CONTRACT_VARIABLE, EXN_PARENT(MZEXN_FAIL_CONTRACT), "exn:fail:contract:variable", 1, MZEXN_FAIL_CONTRACT_VARIABLE_FIELDS, scheme_null, scheme_make_prim(variable_field_check))
  SETUP_STRUCT(MZEXN_FAIL_SYNTAX, EXN_PARENT(MZEXN_FAIL), "exn:fail:syntax", 1, MZEXN_FAIL_SYNTAX_FIELDS, MZEXN_FAIL_SYNTAX_PROPS, scheme_make_prim(syntax_field_check))
  SETUP_STRUCT(MZEXN_FAIL_SYNTAX_UNBOUND, EXN_PARENT(MZEXN_FAIL_SYNTAX), "exn:fail:syntax:unbound", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_SYNTAX_MISSING_MODULE, EXN_PARENT(MZEXN_FAIL_SYNTAX), "exn:fail:syntax:missing-module", 1, MZEXN_FAIL_SYNTAX_MISSING_MODULE_FIELDS, MZEXN_FAIL_SYNTAX_MISSING_MODULE_PROPS, scheme_make_prim(module_path_field_check_3))
  SETUP_STRUCT(MZEXN_FAIL_READ, EXN_PARENT(MZEXN_FAIL), "exn:fail:read", 1, MZEXN_FAIL_READ_FIELDS, MZEXN_FAIL_READ_PROPS, scheme_make_prim(read_field_check))
  SETUP_STRUCT(MZEXN_FAIL_READ_EOF, EXN_PARENT(MZEXN_FAIL_READ), "exn:fail:read:eof", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_READ_NON_CHAR, EXN_PARENT(MZEXN_FAIL_READ), "exn:fail:read:non-char", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_FILESYSTEM, EXN_PARENT(MZEXN_FAIL), "exn:fail:filesystem", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_FILESYSTEM_EXISTS, EXN_PARENT(MZEXN_FAIL_FILESYSTEM), "exn:fail:filesystem:exists", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_FILESYSTEM_VERSION, EXN_PARENT(MZEXN_FAIL_FILESYSTEM), "exn:fail:filesystem:version", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_FILESYSTEM_ERRNO, EXN_PARENT(MZEXN_FAIL_FILESYSTEM), "exn:fail:filesystem:errno", 1, MZEXN_FAIL_FILESYSTEM_ERRNO_FIELDS, scheme_null, scheme_make_prim(errno_field_check))
  SETUP_STRUCT(MZEXN_FAIL_FILESYSTEM_MISSING_MODULE, EXN_PARENT(MZEXN_FAIL_FILESYSTEM), "exn:fail:filesystem:missing-module", 1, MZEXN_FAIL_FILESYSTEM_MISSING_MODULE_FIELDS, MZEXN_FAIL_FILESYSTEM_MISSING_MODULE_PROPS, scheme_make_prim(module_path_field_check_2))
  SETUP_STRUCT(MZEXN_FAIL_NETWORK, EXN_PARENT(MZEXN_FAIL), "exn:fail:network", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_NETWORK_ERRNO, EXN_PARENT(MZEXN_FAIL_NETWORK), "exn:fail:network:errno", 1, MZEXN_FAIL_NETWORK_ERRNO_FIELDS, scheme_null, scheme_make_prim(errno_field_check))
  SETUP_STRUCT(MZEXN_FAIL_OUT_OF_MEMORY, EXN_PARENT(MZEXN_FAIL), "exn:fail:out-of-memory", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_UNSUPPORTED, EXN_PARENT(MZEXN_FAIL), "exn:fail:unsupported", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_FAIL_USER, EXN_PARENT(MZEXN_FAIL), "exn:fail:user", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_BREAK, EXN_PARENT(MZEXN), "exn:break", 1, MZEXN_BREAK_FIELDS, scheme_null, scheme_make_prim(break_field_check))
  SETUP_STRUCT(MZEXN_BREAK_HANG_UP, EXN_PARENT(MZEXN_BREAK), "exn:break:hang-up", 0, NULL, scheme_null, NULL)
  SETUP_STRUCT(MZEXN_BREAK_TERMINATE, EXN_PARENT(MZEXN_BREAK), "exn:break:terminate", 0, NULL, scheme_null, NULL)
#endif
