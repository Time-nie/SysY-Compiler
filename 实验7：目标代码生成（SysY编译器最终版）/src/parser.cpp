/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* "%code top" blocks.  */
#line 2 "src/parser.y" /* yacc.c:316  */

    #include <iostream>
    #include <assert.h>
    #include <cstring>
    #include <stack>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror( char const * );
    std::stack<StmtNode*> While_stack;
    int idx;
    int* arrayValue;
    std::stack<InitArray*> Arr_stack;
    ArrayType* arrayType;
    int leftCnt = 0;
    int paramNo = 0;

#line 81 "src/parser.cpp" /* yacc.c:316  */



/* Copy the first part of user declarations.  */

#line 87 "src/parser.cpp" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "parser.h".  */
#ifndef YY_YY_INCLUDE_PARSER_H_INCLUDED
# define YY_YY_INCLUDE_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 20 "src/parser.y" /* yacc.c:355  */

    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"

#line 123 "src/parser.cpp" /* yacc.c:355  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    INTEGER = 259,
    IF = 260,
    ELSE = 261,
    WHILE = 262,
    INT = 263,
    VOID = 264,
    LPAREN = 265,
    RPAREN = 266,
    LBRACE = 267,
    RBRACE = 268,
    SEMICOLON = 269,
    LBRACKET = 270,
    RBRACKET = 271,
    COMMA = 272,
    ADD = 273,
    SUB = 274,
    MUL = 275,
    DIV = 276,
    MOD = 277,
    OR = 278,
    AND = 279,
    LESS = 280,
    LEQ = 281,
    MORE = 282,
    MEQ = 283,
    ASSIGN = 284,
    EQ = 285,
    NE = 286,
    NOT = 287,
    CONST = 288,
    RETURN = 289,
    BREAK = 290,
    CONTINUE = 291,
    THEN = 292
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 27 "src/parser.y" /* yacc.c:355  */

    int itype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
    SymbolEntry* se;

#line 182 "src/parser.cpp" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_INCLUDE_PARSER_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 199 "src/parser.cpp" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  67
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   205

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  38
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  50
/* YYNRULES -- Number of rules.  */
#define YYNRULES  106
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  181

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   292

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    64,    64,    72,    75,    82,    83,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,   101,   117,
     128,   134,   141,   139,   156,   159,   165,   165,   179,   185,
     192,   196,   201,   204,   210,   214,   218,   219,   224,   232,
     233,   237,   241,   249,   251,   257,   263,   269,   273,   285,
     300,   302,   309,   312,   315,   322,   323,   330,   331,   338,
     339,   343,   350,   351,   355,   359,   363,   375,   386,   397,
     401,   404,   408,   413,   428,   460,   469,   469,   507,   510,
     518,   548,   574,   574,   613,   617,   625,   640,   640,   676,
     700,   726,   726,   760,   763,   770,   773,   770,   801,   802,
     805,   809,   813,   826,   839,   866,   869
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ID", "INTEGER", "IF", "ELSE", "WHILE",
  "INT", "VOID", "LPAREN", "RPAREN", "LBRACE", "RBRACE", "SEMICOLON",
  "LBRACKET", "RBRACKET", "COMMA", "ADD", "SUB", "MUL", "DIV", "MOD", "OR",
  "AND", "LESS", "LEQ", "MORE", "MEQ", "ASSIGN", "EQ", "NE", "NOT",
  "CONST", "RETURN", "BREAK", "CONTINUE", "THEN", "$accept", "Stmts",
  "Stmt", "AssignStmt", "BlockStmt", "IfStmt", "WhileStmt", "BreakStmt",
  "ContinueStmt", "ReturnStmt", "DeclStmt", "FuncDef", "EmptyStmt",
  "FuncDefParams", "FuncDefParam", "VarDefs", "ConstDefs", "VarDef",
  "ConstDef", "ExprStmt", "MaybeFuncDefParams", "Exp", "AddExp", "MulExp",
  "UnaryExp", "InitVal", "ConstInitVal", "InitValList", "ConstInitValList",
  "FuncArrayIndices", "FuncCallExp", "Cond", "LOrExp", "EqExp",
  "PrimaryExp", "LVal", "ArrayIndices", "RelExp", "LAndExp",
  "FuncCallParams", "Type", "Program", "$@1", "@2", "@3", "@4", "@5", "@6",
  "$@7", "$@8", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292
};
# endif

#define YYPACT_NINF -159

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-159)))

#define YYTABLE_NINF -96

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      89,    69,  -159,    -6,     3,  -159,  -159,   173,     4,  -159,
     173,   173,   173,     6,   132,    81,    86,    89,  -159,  -159,
    -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159,
      90,    19,    68,  -159,  -159,  -159,    10,    61,   106,   129,
     173,   104,   173,   173,   109,  -159,  -159,    89,  -159,  -159,
    -159,   123,  -159,   114,  -159,  -159,  -159,  -159,   173,   173,
     173,   173,   173,   173,    13,    64,  -159,  -159,  -159,  -159,
      66,   113,   173,    19,   120,   118,    16,    85,   128,   143,
    -159,    17,    25,   100,  -159,  -159,    68,    68,  -159,  -159,
    -159,   141,   173,    26,   147,  -159,   155,  -159,   173,  -159,
     146,    89,   173,   173,   173,   173,   173,   173,   173,   173,
    -159,  -159,   173,    28,  -159,   123,  -159,  -159,  -159,     6,
      29,  -159,  -159,  -159,   159,   128,    85,    85,    19,    19,
      19,    19,    16,    89,  -159,  -159,  -159,   156,   152,  -159,
     162,   176,    89,  -159,   168,   169,  -159,  -159,     6,  -159,
      30,  -159,   171,  -159,  -159,  -159,   156,  -159,   177,   165,
     173,   170,  -159,   168,  -159,    50,  -159,  -159,  -159,  -159,
     173,  -159,    63,  -159,   156,   174,  -159,   168,  -159,  -159,
    -159
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,    18,    54,     0,     0,     3,     4,     0,    22,    32,
       0,     0,     0,     0,     0,     0,     0,     2,     5,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
       0,    34,    36,    39,    47,    43,    53,     0,     0,     0,
       0,    19,     0,     0,     0,    53,    33,     0,    44,    45,
      46,     0,    31,     0,    28,    29,     6,    20,     0,     0,
       0,     0,     0,     0,    73,     0,    70,     1,    48,    50,
       0,     0,     0,    62,     0,    35,    57,    59,    55,     0,
      52,     0,     0,     0,    72,    30,    37,    38,    40,    41,
      42,     0,     0,    74,     0,    67,     0,    49,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    23,     0,     0,    68,     0,    21,    75,    76,    99,
      73,    69,    51,    79,    24,    56,    60,    61,    63,    64,
      65,    66,    58,     0,    86,    87,    71,     0,    98,   101,
       0,     0,     0,    27,     0,    82,    80,    77,     0,    96,
     102,    25,    91,    89,    88,    81,     0,   100,     0,     0,
       0,   104,    90,     0,    84,     0,    22,    97,   105,   103,
       0,    93,     0,    83,     0,     0,    92,     0,    85,   106,
      94
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -159,   148,   -15,  -159,    35,  -159,  -159,  -159,  -159,  -159,
    -159,  -159,  -159,  -159,    46,  -159,  -159,   101,    83,  -159,
    -159,    -7,   -34,    57,     0,  -140,  -158,  -159,  -159,  -159,
    -159,   153,  -159,    92,  -159,     1,     5,    41,    97,  -159,
     -10,  -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,   138,   139,    65,    83,    66,    84,    29,
     140,    30,    31,    32,    33,   147,   154,   165,   172,   161,
      34,    74,    75,    76,    35,    45,    93,    77,    78,    70,
      37,    38,    47,   133,   137,   156,   144,   163,    94,   158
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      44,    36,    56,    51,    42,   171,    41,    53,    73,    73,
      48,    49,    50,    43,     5,     6,   164,    46,    36,   180,
       1,     2,     3,   -95,     4,     5,     6,     7,    40,     8,
     111,     9,    69,    71,   178,    10,    11,    58,    59,    63,
      40,    72,    92,    72,    40,   159,   103,   104,    36,    12,
      13,    14,    15,    16,   112,   118,    91,   135,    92,   160,
      88,    89,    90,   173,    64,   100,    56,   174,    73,    73,
      73,   128,   129,   130,   131,    73,   176,    97,    95,    39,
     177,    96,    36,    98,    40,   117,   124,   113,    60,    61,
      62,   122,     1,     2,     3,    54,     4,     5,     6,     7,
      55,     8,    36,     9,    57,   134,    67,    10,    11,   141,
     105,   106,   107,   108,   114,    86,    87,   115,   143,    72,
      80,    12,    13,    14,    15,    16,    82,   151,    85,    99,
     146,   101,     1,     2,    36,     1,     2,   153,   141,     7,
      68,   102,     7,    36,   126,   127,    52,    10,    11,   146,
      10,    11,   109,   169,   110,   116,   153,   119,   120,     1,
       2,    12,   123,   175,    12,   142,     7,   146,   145,   148,
     153,     1,     2,   149,    10,    11,     1,     2,     7,   150,
     152,   168,   155,     7,   162,   170,    10,    11,    12,   166,
     179,    10,    11,   167,   157,    81,    79,   121,   136,   125,
      12,   132,     0,     0,     0,    12
};

static const yytype_int16 yycheck[] =
{
       7,     0,    17,    13,    10,   163,     1,    14,    42,    43,
      10,    11,    12,    10,     8,     9,   156,    13,    17,   177,
       3,     4,     5,    10,     7,     8,     9,    10,    15,    12,
      13,    14,    39,    40,   174,    18,    19,    18,    19,    29,
      15,    15,    29,    15,    15,    15,    30,    31,    47,    32,
      33,    34,    35,    36,    29,    29,    63,    29,    29,    29,
      60,    61,    62,    13,     3,    72,    81,    17,   102,   103,
     104,   105,   106,   107,   108,   109,    13,    11,    14,    10,
      17,    17,    81,    17,    15,    92,   101,    82,    20,    21,
      22,    98,     3,     4,     5,    14,     7,     8,     9,    10,
      14,    12,   101,    14,    14,   112,     0,    18,    19,   119,
      25,    26,    27,    28,    14,    58,    59,    17,   133,    15,
      11,    32,    33,    34,    35,    36,     3,   142,    14,    16,
     137,    11,     3,     4,   133,     3,     4,   144,   148,    10,
      11,    23,    10,   142,   103,   104,    14,    18,    19,   156,
      18,    19,    24,   160,    11,    14,   163,    10,     3,     3,
       4,    32,    16,   170,    32,     6,    10,   174,    12,    17,
     177,     3,     4,    11,    18,    19,     3,     4,    10,     3,
      12,    16,    13,    10,    13,    15,    18,    19,    32,    12,
      16,    18,    19,   158,   148,    47,    43,    96,   115,   102,
      32,   109,    -1,    -1,    -1,    32
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,     5,     7,     8,     9,    10,    12,    14,
      18,    19,    32,    33,    34,    35,    36,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    57,
      59,    60,    61,    62,    68,    72,    73,    78,    79,    10,
      15,    74,    10,    10,    59,    73,    13,    80,    62,    62,
      62,    78,    14,    59,    14,    14,    40,    14,    18,    19,
      20,    21,    22,    29,     3,    53,    55,     0,    11,    59,
      77,    59,    15,    60,    69,    70,    71,    75,    76,    69,
      11,    39,     3,    54,    56,    14,    61,    61,    62,    62,
      62,    59,    29,    74,    86,    14,    17,    11,    17,    16,
      59,    11,    23,    30,    31,    25,    26,    27,    28,    24,
      11,    13,    29,    74,    14,    17,    14,    59,    29,    10,
       3,    55,    59,    16,    40,    76,    75,    75,    60,    60,
      60,    60,    71,    81,    59,    29,    56,    82,    51,    52,
      58,    78,     6,    40,    84,    12,    59,    63,    17,    11,
       3,    40,    12,    59,    64,    13,    83,    52,    87,    15,
      29,    67,    13,    85,    63,    65,    12,    42,    16,    59,
      15,    64,    66,    13,    17,    59,    13,    17,    63,    16,
      64
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    38,    79,    78,    78,    39,    39,    40,    40,    40,
      40,    40,    40,    40,    40,    40,    40,    40,    73,    73,
      57,    41,    80,    42,    43,    43,    81,    44,    45,    46,
      47,    47,    50,    50,    59,    69,    60,    60,    60,    61,
      61,    61,    61,    62,    62,    62,    62,    62,    68,    68,
      77,    77,    72,    72,    72,    70,    70,    76,    76,    71,
      71,    71,    75,    75,    75,    75,    75,    48,    48,    53,
      53,    54,    54,    55,    55,    55,    82,    55,    74,    74,
      63,    63,    83,    63,    65,    65,    56,    84,    56,    64,
      64,    85,    64,    66,    66,    86,    87,    49,    58,    58,
      51,    51,    52,    52,    52,    67,    67
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     1,     1,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       2,     4,     0,     4,     5,     7,     0,     6,     2,     2,
       3,     2,     1,     2,     1,     1,     1,     3,     3,     1,
       3,     3,     3,     1,     2,     2,     2,     1,     3,     4,
       1,     3,     3,     1,     1,     1,     3,     1,     3,     1,
       3,     3,     1,     3,     3,     3,     3,     3,     4,     3,
       1,     3,     1,     1,     2,     3,     0,     5,     3,     4,
       1,     2,     0,     4,     1,     3,     3,     0,     5,     1,
       2,     0,     4,     1,     3,     0,     0,     8,     1,     0,
       3,     1,     2,     4,     3,     2,     4
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 64 "src/parser.y" /* yacc.c:1646  */
    {
        ast.setRoot((yyvsp[0].stmttype));
    }
#line 1417 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 3:
#line 72 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.type) = TypeSystem::intType;
    }
#line 1425 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 4:
#line 75 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.type) = TypeSystem::voidType;
    }
#line 1433 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 5:
#line 82 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1439 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 6:
#line 83 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype));
    }
#line 1447 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 7:
#line 88 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1453 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 8:
#line 89 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1459 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 9:
#line 90 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1465 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 10:
#line 91 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1471 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 11:
#line 92 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1477 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 12:
#line 93 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1483 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 13:
#line 94 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1489 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 14:
#line 95 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1495 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 15:
#line 96 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1501 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 16:
#line 97 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1507 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 17:
#line 98 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1513 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 18:
#line 101 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry *se;
        //identifiers为一个SymbolTable*类型的外部变量
        //寻找当前域中是否有这个标识符，并返回表项指针，若没有，则语法有问题，报错
        se = identifiers->lookup((yyvsp[0].strtype));
        if(se == nullptr)
        {
            // 如果找不到报错
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[0].strtype));
            delete [](char*)(yyvsp[0].strtype);
            assert(se != nullptr);
        }
        //new了一个ID类的结点，这个类继承自ExprNode
        (yyval.exprtype) = new Id(se);
        delete [](yyvsp[0].strtype);
    }
#line 1534 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 19:
#line 117 "src/parser.y" /* yacc.c:1646  */
    {  //数组
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-1].strtype));
        if(se == nullptr)
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[-1].strtype));
        (yyval.exprtype) = new Id(se, (yyvsp[0].exprtype));
        delete [](yyvsp[-1].strtype);
    }
#line 1547 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 20:
#line 128 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new ExprStmt((yyvsp[-1].exprtype));
    }
#line 1555 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 21:
#line 134 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype));
    }
#line 1563 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 22:
#line 141 "src/parser.y" /* yacc.c:1646  */
    {identifiers = new SymbolTable(identifiers);}
#line 1569 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 23:
#line 143 "src/parser.y" /* yacc.c:1646  */
    {
            //每一个{}的作用域里面都是一个复合语句-此处为抽象的非终结符Stmts
            (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
            //遇到}，当前的块语句结束，删除top符号表
            SymbolTable *top = identifiers;
            identifiers = identifiers->getPrev();
            delete top;
        }
#line 1582 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 24:
#line 156 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1590 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 25:
#line 159 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
    }
#line 1598 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 26:
#line 165 "src/parser.y" /* yacc.c:1646  */
    {
        WhileStmt *whileNode = new WhileStmt((yyvsp[-1].exprtype));
        (yyval.stmttype) = whileNode;
        While_stack.push(whileNode);
        }
#line 1608 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 27:
#line 170 "src/parser.y" /* yacc.c:1646  */
    {
        StmtNode *whileNode = (yyvsp[-1].stmttype); 
        ((WhileStmt*)whileNode)->setStmt((yyvsp[0].stmttype));
        (yyval.stmttype)=whileNode;
        While_stack.pop();
    }
#line 1619 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 28:
#line 179 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new BreakStmt(While_stack.top());
    }
#line 1627 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 29:
#line 185 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new ContinueStmt(While_stack.top());
        // $$ = new ContinueStmt();
    }
#line 1636 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 30:
#line 192 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new ReturnStmt((yyvsp[-1].exprtype));
    }
#line 1644 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 31:
#line 196 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new ReturnStmt();
    }
#line 1652 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 32:
#line 201 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = new EmptyStmt();
    }
#line 1660 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 33:
#line 204 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype)=new EmptyStmt();
    }
#line 1668 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 34:
#line 210 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1674 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 35:
#line 214 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1680 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 36:
#line 218 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1686 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 37:
#line 220 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1695 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 38:
#line 225 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1704 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 39:
#line 232 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1710 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 40:
#line 233 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1719 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 41:
#line 237 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1728 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 42:
#line 241 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1737 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 43:
#line 249 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1743 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 44:
#line 252 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::ADD, (yyvsp[0].exprtype));
    }
#line 1752 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 45:
#line 258 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype));
    }
#line 1761 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 46:
#line 264 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NOT, (yyvsp[0].exprtype));
    }
#line 1770 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 47:
#line 269 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1776 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 48:
#line 273 "src/parser.y" /* yacc.c:1646  */
    {   // 没有参数
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-2].strtype));
        //函数调用前必须要有声明/定义
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-2].strtype));
            delete [](char*)(yyvsp[-2].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new FuncCallExpr(se);
    }
#line 1793 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 49:
#line 285 "src/parser.y" /* yacc.c:1646  */
    {   
        SymbolEntry* se;   
        se = identifiers->lookup((yyvsp[-3].strtype));
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-3].strtype));
            delete [](char*)(yyvsp[-3].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new FuncCallExpr(se, (yyvsp[-1].exprtype));
    }
#line 1809 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 50:
#line 300 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1815 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 51:
#line 302 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        (yyval.exprtype)->setLink((yyvsp[0].exprtype));
    }
#line 1824 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 52:
#line 309 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 1832 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 53:
#line 312 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1840 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 54:
#line 315 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1849 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 55:
#line 322 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1855 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 56:
#line 323 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1864 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 57:
#line 330 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1870 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 58:
#line 331 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1879 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 59:
#line 338 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1885 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 60:
#line 339 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQ, (yyvsp[0].exprtype), (yyvsp[-2].exprtype));
    }
#line 1894 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 61:
#line 343 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NE, (yyvsp[0].exprtype), (yyvsp[-2].exprtype));
    }
#line 1903 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 62:
#line 350 "src/parser.y" /* yacc.c:1646  */
    {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1909 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 63:
#line 351 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MORE, (yyvsp[0].exprtype), (yyvsp[-2].exprtype));
    }
#line 1918 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 64:
#line 355 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MEQ, (yyvsp[0].exprtype), (yyvsp[-2].exprtype));
    }
#line 1927 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 65:
#line 359 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[0].exprtype), (yyvsp[-2].exprtype));
    }
#line 1936 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 66:
#line 363 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LEQ, (yyvsp[0].exprtype), (yyvsp[-2].exprtype));
    }
#line 1945 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 67:
#line 375 "src/parser.y" /* yacc.c:1646  */
    {
        //变量的类型不能为void
        if((yyvsp[-2].type)==TypeSystem::voidType)
        {
            fprintf(stderr, "variable type can't be void type\n");   
            assert((yyvsp[-2].type)!=TypeSystem::voidType);
        }
        (yyval.stmttype) = (yyvsp[-1].stmttype);
    }
#line 1959 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 68:
#line 386 "src/parser.y" /* yacc.c:1646  */
    {
        //常量的类型不能为void
        if((yyvsp[-2].type)==TypeSystem::voidType)
        {
            fprintf(stderr, "constant variable type can't be void type\n");   
            assert((yyvsp[-2].type)!=TypeSystem::voidType);
        }
        (yyval.stmttype) = (yyvsp[-1].stmttype);
    }
#line 1973 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 69:
#line 397 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setLink((yyvsp[0].stmttype)); //参数表的参数通过指针串起来
    }
#line 1982 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 70:
#line 401 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1988 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 71:
#line 404 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setLink((yyvsp[0].stmttype));
    }
#line 1997 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 72:
#line 408 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 2003 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 73:
#line 413 "src/parser.y" /* yacc.c:1646  */
    {   //新创建标识符，和前面的LVAL不同
        //检查变量是否重复声明
        if(identifiers->lookup((yyvsp[0].strtype)))
        {
            //在当前作用域能够找到这个标识符名字，表示重复定义
            fprintf(stderr, "identifier \"%s\" is defined twice\n", (char*)(yyvsp[0].strtype));
            //assert(identifiers->lookup($1)==nullptr);
        }
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 2022 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 74:
#line 428 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"VarDef:ID ArrayIndices\n");
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = (yyvsp[0].exprtype);
        //获取每一个数组维度的值，如2
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getLink());
        }
        Type *type = TypeSystem::intType;
        Type* temp1;

        //设置当前数组的类型type->多维数组-数组的数组        
        while(!vec.empty()){
            temp1 = new ArrayType(type, vec.back());
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
            vec.pop_back();
        }
        arrayType = (ArrayType*)type;
        se = new IdentifierSymbolEntry(type, (yyvsp[-1].strtype), identifiers->getLevel());

        // 当前的情况是未赋初值的数组，所以调用setAllZero        
        ((IdentifierSymbolEntry*)se)->makeZero();
        int *p = new int[type->getSize()];
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);
        identifiers->install((yyvsp[-1].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 2059 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 75:
#line 460 "src/parser.y" /* yacc.c:1646  */
    {
        //配合样例先删去
        //检查变量是否重复声明
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[-2].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[-2].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 2073 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 76:
#line 469 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"VarDef-ID ArrayIndices ASSIGN\n");
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = (yyvsp[-1].exprtype);
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getLink());
        }
        Type* type = TypeSystem::intType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        //把Arr_stack清空
        std::stack<InitArray*>().swap(Arr_stack);
        se = new IdentifierSymbolEntry(type, (yyvsp[-2].strtype), identifiers->getLevel());
        (yyval.se) = se;
        arrayValue = new int[arrayType->getSize()];
    }
#line 2103 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 77:
#line 494 "src/parser.y" /* yacc.c:1646  */
    {
   
        //arrayValue在InitVal的语义动作中去赋值  
        ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setArrayValue(arrayValue);
        if(((InitArray*)(yyvsp[0].exprtype))->isEmpty())
            ((IdentifierSymbolEntry*)(yyvsp[-1].se))->makeZero();
        identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se));
        (yyval.stmttype) = new DeclStmt(new Id((yyvsp[-1].se)), (yyvsp[0].exprtype));
        delete [](yyvsp[-4].strtype);
    }
#line 2118 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 78:
#line 507 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 2126 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 79:
#line 510 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyvsp[-3].exprtype)->setLink((yyvsp[-1].exprtype));
    }
#line 2135 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 80:
#line 518 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"InitVal-Exp IN\n");
        fprintf(stderr,"%s\n",(yyvsp[0].exprtype)->getSymPtr()->getType()->toStr().c_str());
        fprintf(stderr,"111111111111111111\n");
        (yyval.exprtype) = (yyvsp[0].exprtype);
        if(!Arr_stack.empty()){
            arrayValue[idx++] = (yyvsp[0].exprtype)->getValue();
            Type* arrTy = Arr_stack.top()->getSymPtr()->getType();
            if(arrTy == TypeSystem::intType)
                Arr_stack.top()->addExpr((yyvsp[0].exprtype));
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getEType() != TypeSystem::intType){
                        arrTy = ((ArrayType*)arrTy)->getEType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitArray* list = new InitArray(se);
                        Arr_stack.top()->addExpr(list);
                        Arr_stack.push(list);
                    }else{
                        Arr_stack.top()->addExpr((yyvsp[0].exprtype));
                        while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            Arr_stack.pop();
                        }
                        break;
                    }
                }
        fprintf(stderr,"InitVal-Exp out\n");
        }         
    }
#line 2170 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 81:
#line 548 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"InitVal-LBRACE RBRACE\n");
        SymbolEntry* se;
        ExprNode* list;
        if(Arr_stack.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空,此时也没必要再加入栈了
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::intType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitArray(se);
        }else{//{{1,2},{}}
            // 栈不空说明肯定不是只有{}
            // 此时需要确定{}到底占了几个元素
            Type* type = ((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType();
            int len = type->getSize() / TypeSystem::intType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitArray(se);
            Arr_stack.top()->addExpr(list);
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        }
        (yyval.exprtype) = list;
    }
#line 2201 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 82:
#line 574 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"InitVal-LBRACE\n");
        SymbolEntry* se;
        //取当前initValue的arraytype
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getEType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getEType());
        }
        InitArray* expr = new InitArray(se);
        if(!Arr_stack.empty())
            Arr_stack.top()->addExpr(expr);
        Arr_stack.push(expr);
        (yyval.exprtype) = expr;
        leftCnt++;
        fprintf(stderr,"InitVal-LBRACE-out\n");
    }
#line 2224 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 83:
#line 592 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"InitValList RBRACE\n");
        leftCnt--;
        while(Arr_stack.top() != (yyvsp[-2].exprtype) && Arr_stack.size() > (long unsigned int)(leftCnt + 1))
            Arr_stack.pop();
        if(Arr_stack.top() == (yyvsp[-2].exprtype))
            Arr_stack.pop();
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        if(!Arr_stack.empty())
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        int size = ((ArrayType*)((yyval.exprtype)->getSymPtr()->getType()))->getSize()/ TypeSystem::intType->getSize();
        while(idx % size != 0)
            arrayValue[idx++] = 0;
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
    }
#line 2247 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 84:
#line 613 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"InitValList-InitVal\n");
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 2256 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 85:
#line 617 "src/parser.y" /* yacc.c:1646  */
    {
        fprintf(stderr,"InitValList-InitValList COMMA InitVal\n");
        (yyval.exprtype) = (yyvsp[-2].exprtype);
    }
#line 2265 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 86:
#line 625 "src/parser.y" /* yacc.c:1646  */
    {
        //检查常量是否重复声明
        if(identifiers->lookup((yyvsp[-2].strtype)))
        {
            //在当前作用域能够找到这个标识符名字，表示重复定义
            fprintf(stderr, "constant identifier \"%s\" is defined twice\n", (char*)(yyvsp[-2].strtype));
            assert(identifiers->lookup((yyvsp[-2].strtype))==nullptr);
        }
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, (yyvsp[-2].strtype), identifiers->getLevel());
        se->SetValue((yyvsp[0].exprtype)->getValue());
        identifiers->install((yyvsp[-2].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 2285 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 87:
#line 640 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = (yyvsp[-1].exprtype);
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getLink());
        }
        Type* type = TypeSystem::constIntType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it, true);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        std::stack<InitArray*>().swap(Arr_stack);
        se = new IdentifierSymbolEntry(type, (yyvsp[-2].strtype), identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        (yyval.se) = se;
        arrayValue = new int[arrayType->getSize()];
    }
#line 2314 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 88:
#line 664 "src/parser.y" /* yacc.c:1646  */
    {
        ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setArrayValue(arrayValue);
        identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se));
        // if(!identifiers->install($1, $<se>4))
        //     fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se));
        (yyval.stmttype) = new DeclStmt(new Id((yyvsp[-1].se)), (yyvsp[0].exprtype));
        delete [](yyvsp[-4].strtype);
    }
#line 2328 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 89:
#line 676 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[0].exprtype);
        if(!Arr_stack.empty()){
            arrayValue[idx++] = (yyvsp[0].exprtype)->getValue();
            Type* arrTy = Arr_stack.top()->getSymPtr()->getType();
            if(arrTy == TypeSystem::constIntType)
                Arr_stack.top()->addExpr((yyvsp[0].exprtype));
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getEType() != TypeSystem::constIntType){
                        arrTy = ((ArrayType*)arrTy)->getEType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitArray* list = new InitArray(se);
                        Arr_stack.top()->addExpr(list);                                                                                                                                                                                                                                                                                 }else{
                        Arr_stack.top()->addExpr((yyvsp[0].exprtype));
                        while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            Arr_stack.pop();
                        }
                        break;
                    }
                }
        }
    }
#line 2357 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 90:
#line 700 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se;
        ExprNode* list;
        if(Arr_stack.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空
            // 此时也没必要再加入栈了
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::constIntType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitArray(se);
        }else{
            // 栈不空说明肯定不是只有{}
            // 此时需要确定{}到底占了几个元素
            Type* type = ((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType();
            int len = type->getSize() / TypeSystem::constIntType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitArray(se);
            Arr_stack.top()->addExpr(list);
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        }
        (yyval.exprtype) = list;
    }
#line 2388 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 91:
#line 726 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se;
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getEType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getEType());
        }
        InitArray* expr = new InitArray(se);
        if(!Arr_stack.empty())
            Arr_stack.top()->addExpr(expr);
        Arr_stack.push(expr);
        (yyval.exprtype) = expr;
        leftCnt++;
    }
#line 2408 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 92:
#line 741 "src/parser.y" /* yacc.c:1646  */
    {
        leftCnt--;
        while(Arr_stack.top() != (yyvsp[-2].exprtype) && Arr_stack.size() > (long unsigned int)(leftCnt + 1))
            Arr_stack.pop();
        if(Arr_stack.top() == (yyvsp[-2].exprtype))
            Arr_stack.pop();
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        if(!Arr_stack.empty())
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        while(idx % (((ArrayType*)((yyval.exprtype)->getSymPtr()->getType()))->getSize()/ sizeof(int)) !=0 )
            arrayValue[idx++] = 0;
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
    }
#line 2429 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 93:
#line 760 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 2437 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 94:
#line 763 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
    }
#line 2445 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 95:
#line 770 "src/parser.y" /* yacc.c:1646  */
    {
        identifiers = new SymbolTable(identifiers);
    }
#line 2453 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 96:
#line 773 "src/parser.y" /* yacc.c:1646  */
    {
        Type* funcType;
        std::vector<Type*> vec;
        std::vector<SymbolEntry*> vec1;
        DeclStmt* temp = (DeclStmt*)(yyvsp[-1].stmttype);
        while(temp){
            vec.push_back(temp->getId()->getSymPtr()->getType());
            vec1.push_back(temp->getId()->getSymPtr());
            temp = (DeclStmt*)(temp->getLink());
        }
        funcType = new FunctionType((yyvsp[-5].type), vec, vec1);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, (yyvsp[-4].strtype), identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install((yyvsp[-4].strtype), se);
        // $<se>$ = se;
    }
#line 2473 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 97:
#line 788 "src/parser.y" /* yacc.c:1646  */
    {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-6].strtype));
        assert(se != nullptr);
        (yyval.stmttype) = new FunctionDef(se, (yyvsp[0].stmttype), (DeclStmt*)(yyvsp[-3].stmttype));
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete [](yyvsp[-6].strtype);
    }
#line 2488 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 98:
#line 801 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 2494 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 99:
#line 802 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype) = nullptr;}
#line 2500 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 100:
#line 805 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyval.stmttype)->setLink((yyvsp[0].stmttype));
    }
#line 2509 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 101:
#line 809 "src/parser.y" /* yacc.c:1646  */
    {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 2515 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 102:
#line 813 "src/parser.y" /* yacc.c:1646  */
    {
        //if(identifiers->lookup($2))
        //{
        //    //在当前作用域能够找到这个标识符名字，表示重复定义
        //    fprintf(stderr, "function parameter \"%s\" is defined twice\n", (char*)$2);
        //    assert(identifiers->lookup($2)==nullptr);
        //}
        SymbolEntry* se;
        se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);    
    }
#line 2533 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 103:
#line 826 "src/parser.y" /* yacc.c:1646  */
    {
        //if(identifiers->lookup($2))
        //{
        //    //在当前作用域能够找到这个标识符名字，表示重复定义
        //    fprintf(stderr, "function parameter \"%s\" is defined twice\n", (char*)$2);
        //    assert(identifiers->lookup($2)==nullptr);
        //}
        SymbolEntry *se;
        se = new IdentifierSymbolEntry((yyvsp[-3].type), (yyvsp[-2].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[-2].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se),(yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 2551 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 104:
#line 839 "src/parser.y" /* yacc.c:1646  */
    {
        // 这里也需要求值
        SymbolEntry* se;
        ExprNode* temp = (yyvsp[0].exprtype);
        Type* arr = TypeSystem::intType;
        Type* arr1;
        std::stack<ExprNode*> Arr_stack;
        while(temp){
            Arr_stack.push(temp);
            temp = (ExprNode*)(temp->getLink());
        }
        while(!Arr_stack.empty()){
            arr1 = new ArrayType(arr, Arr_stack.top()->getValue());
            if(arr->isArray())
                ((ArrayType*)arr)->setArrayType(arr1);
            arr = arr1;
            Arr_stack.pop();
        }
        se = new IdentifierSymbolEntry(arr, (yyvsp[-1].strtype), identifiers->getLevel(), paramNo++);
        identifiers->install((yyvsp[-1].strtype), se);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 2581 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 105:
#line 866 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = new EmptyNode();
    }
#line 2589 "src/parser.cpp" /* yacc.c:1646  */
    break;

  case 106:
#line 869 "src/parser.y" /* yacc.c:1646  */
    {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyval.exprtype)->setLink((yyvsp[-1].exprtype));
    }
#line 2598 "src/parser.cpp" /* yacc.c:1646  */
    break;


#line 2602 "src/parser.cpp" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 874 "src/parser.y" /* yacc.c:1906  */


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
