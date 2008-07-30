From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Test programs for math function bug reports
Date: Wed, 30 Jul 2008 16:39:16 +0200
Message-ID: <cfd18e0f0807300739u3dc1982r339ce72896d5344f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andreas,

By now you'll probably have noticed that I've started filing bug
reports for the math functions.  (There's still quite a few to come.)
You might also have noticed that I haven't included test code with
each report.  The reason is that I have a script that generates test
programs for the math functions.  You just supply the script with
function name, type (float, long, long double), descriptions of
arguments (if other than the default type), and it produces a C
program of just under 400 lines that can be used to carry out various
kinds of test, driven by command-line arguments.

Should I include the generated test program in each bug report?  (I
hesitated, because the programs are longish.  The alternative is that
I put my generator script up somewhere on the web and you can
download, and build whatever test programs you need.)

Also, if you think that having a script to generate programs such as
the one below miight be useful for glibc testing, let me know.

To give you an idea of what these test programs look like, I've
appended one below.   Here's an example of how it works (here
demonstrating a bug in pow(), which should set errno to ERANGE for
this case):

$ /tmp/mt_pow -- 0 -3
errno == EDOM
fetestexcept() says:  FE_DIVBYZERO
pow(0.00000000000000000e+00,-3.00000000000000000e+00)=inf
EDOM FE_DIVBYZERO +inf

Cheers,

Michael

/* /tmp/mt_pow.c (auto-generated at 2008-07-30 16:24:38) */
#define _XOPEN_SOURCE 600
#define _GNU_SOURCE
#include <assert.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <fenv.h>
#include <limits.h>
#include <math.h>
#include <float.h>
#include <ctype.h>

#define EXIT_test_setup_failed 2

static int verbose = 1;

/* Convert a string to a double, but allow a few special cases
   in the form of non-numeric strings */

static double
string_to_d(char *str)
{
    char *p;
    char *s;
    double retval;

    s = strdup(str);
    if (s == NULL) {
        perror("strdup");
        exit(EXIT_test_setup_failed);
    }

    for (p = s; *p; p++)
        *p = toupper(*p);

    if (strcmp(s, "-INF") == 0)
        retval = -HUGE_VAL;
    else if (strcmp(s, "INF") == 0 || strcmp(s, "+INF") == 0)
        retval = HUGE_VAL;
    else if (strcmp(s, "NAN") == 0)
        retval = nan("");

    else if (strcmp(s, "MIN") == 0 || strcmp(s, "+MIN") == 0)
        retval = DBL_MIN;
    else if (strcmp(s, "-MIN") == 0)
        retval = -DBL_MIN;
    else if (strcmp(s, "MAX") == 0 || strcmp(s, "+MAX") == 0)
        retval = DBL_MAX;
    else if (strcmp(s, "-MAX") == 0)
        retval = -DBL_MAX;

    else if (strcmp(s, "DBL_MIN") == 0)
        retval = DBL_MIN;
    else if (strcmp(s, "-DBL_MIN") == 0)
        retval = -DBL_MIN;
    else if (strcmp(s, "DBL_MAX") == 0)
        retval = DBL_MAX;
    else if (strcmp(s, "-DBL_MAX") == 0)
        retval = -DBL_MAX;

    else if (strcmp(s, "FLT_MIN") == 0)
        retval = FLT_MIN;
    else if (strcmp(s, "-FLT_MIN") == 0)
        retval = -FLT_MIN;
    else if (strcmp(s, "FLT_MAX") == 0)
        retval = FLT_MAX;
    else if (strcmp(s, "-FLT_MAX") == 0)
        retval = -FLT_MAX;

    else if (strcmp(s, "LDBL_MIN") == 0)
        retval = LDBL_MIN;
    else if (strcmp(s, "-LDBL_MIN") == 0)
        retval = -LDBL_MIN;
    else if (strcmp(s, "LDBL_MAX") == 0)
        retval = LDBL_MAX;
    else if (strcmp(s, "-LDBL_MAX") == 0)
        retval = -LDBL_MAX;

    else if (strncmp(s, "SUBNORMAL", 9) == 0 ||
             strncmp(s, "-SUBNORMAL", 10) == 0) {
        char *h;
        int d, j;

        h = strchr(s, ':');
        if (h == NULL)
            d = 4;
        else
            d = atoi(h + 1);
        retval = DBL_MIN;
        for (j = 0; j < d; j++)
            retval /= 2.0;
        if (s[0] == '-')
            retval = -retval;
    } else if (strchr("+-0123456789", s[0]) == NULL) {
        fprintf(stderr, "Bad argument: %s\n", s);
        exit(EXIT_test_setup_failed);
    } else
        retval = strtod(s, NULL);

    free(s);
    return retval;
}

static void
clearErrors(void)
{
    errno = 0;
    feclearexcept(FE_ALL_EXCEPT);
}

static void
checkErrors(int *r_errno, int *r_except)
{
    *r_errno = errno;

    if (verbose) {
        if (*r_errno == 0) {
            fprintf(stderr, "errno == 0\n");
        } else {
            if (*r_errno == EDOM)
                fprintf(stderr, "errno == EDOM\n");
            else if (*r_errno == ERANGE)
                fprintf(stderr, "errno == ERANGE\n");
            else
                fprintf(stderr, "errno == %d\n", *r_errno);
        }
    }

    *r_except = fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
                         FE_UNDERFLOW | FE_INEXACT);

    if (verbose) {
        printf("fetestexcept() says: ");
        if (*r_except & FE_INVALID)
            printf(" FE_INVALID");
        if (*r_except & FE_DIVBYZERO)
            printf(" FE_DIVBYZERO");
        if (*r_except & FE_OVERFLOW)
            printf(" FE_OVERFLOW");
        if (*r_except & FE_UNDERFLOW)
            printf(" FE_UNDERFLOW");
        if (*r_except & FE_INEXACT)
            printf(" FE_INEXACT");
        printf("\n");
    }
}

static void
usage(char *pname, char *msg)
{
    if (msg != NULL)
        fprintf(stderr, "%s\n", msg);
    fprintf(stderr, "Usage: %s [-q] [-e errno,except,class] <args>\n",
                    pname);
    fprintf(stderr, "-q  quiet\n");
    fprintf(stderr, "-e  expected results, expressed via errno, exception,"
                    "and class of function result\n");
    fprintf(stderr, "    errno can be EDOM, ERANGE, or 0\n");
    fprintf(stderr, "    except can be FP_INVALID, FE_DIVBYZERO, "
                    "FP_OVERFLOW, FP_UNDERFLOW, or 0\n");
    fprintf(stderr, "    class can be +0, -0, +inf, -inf, nan, normal, "
                    "or subnormal\n");
    exit(EXIT_test_setup_failed);
}

int
main(int argc, char *argv[])
{
    int opt;
    int e_errno, e_except, e_class, e_sign;
    int dont_check_errno = 0, dont_check_except = 0, dont_check_class = 0;
    int e_opt_present;
    int r_errno, r_except;
    int exit_status = EXIT_SUCCESS;
    int value_expected = 0;
    char *perrno, *pexcept, *pclass;

    double x;
    double y;
    double result;
    double e_value;
    int int_value_expected = 0;

    e_opt_present = 0;
    while ((opt = getopt(argc, argv, "qe:")) != -1) {
        //printf("opt=%c\n", opt);
        switch (opt) {
        case 'q':
            verbose = 0;
            break;

        case 'e':
            {
            char *c1, *c2, *p;

            e_opt_present = 1;

            for (p = optarg; *p != '\0'; p++)
                *p = toupper(*p);

            c1 = strchr(optarg, ',');
            if (c1 == NULL)
                usage(argv[0], "bad -e spec");
            *c1 = '\0';

            c2 = strchr(c1 + 1, ',');
            if (c2 == NULL)
                usage(argv[0], "bad -e spec");
            *c2 = '\0';

            perrno = optarg;
            pexcept = c1 + 1;
            pclass = c2 + 1;

            if (strcmp(perrno, "*") == 0)
                dont_check_errno = 1;
            else if (strcmp(perrno, "0") == 0)
                e_errno = 0;
            else if (strcmp(perrno, "EDOM") == 0)
                e_errno = EDOM;
            else if (strcmp(perrno, "ERANGE") == 0)
                e_errno = ERANGE;
            else
                usage(argv[0], "Bad errno in -e spec");

            if (strcmp(pexcept, "*") == 0)
                dont_check_except = 1;
            else if (strcmp(pexcept, "0") == 0)
                e_except = 0;
            else if (strcmp(pexcept, "FE_DIVBYZERO") == 0)
                e_except = FE_DIVBYZERO;
            else if (strcmp(pexcept, "FE_INVALID") == 0)
                e_except = FE_INVALID;
            else if (strcmp(pexcept, "FE_OVERFLOW") == 0)
                e_except = FE_OVERFLOW;
            else if (strcmp(pexcept, "FE_UNDERFLOW") == 0)
                e_except = FE_UNDERFLOW;
            else
                usage(argv[0], "Bad except in -e spec");


            if (strcmp(pclass, "*") == 0)
                dont_check_class = 1;
            else if (strcmp(pclass, "+0") == 0) {
                e_class = FP_ZERO;
                e_sign = +1;
            } else if (strcmp(pclass, "-0") == 0) {
                e_class = FP_ZERO;
                e_sign = -1;
            } else if (strcmp(pclass, "+INF") == 0) {
                e_class = FP_INFINITE;
                e_sign = +1;
            } else if (strcmp(pclass, "-INF") == 0) {
                e_class = FP_INFINITE;
                e_sign = -1;
            } else if (strcmp(pclass, "NORMAL") == 0) {
                e_class = FP_NORMAL;
            } else if (strcmp(pclass, "SUBNORMAL") == 0) {
                e_class = FP_SUBNORMAL;
            } else if (strcmp(pclass, "NAN") == 0) {
                e_class = FP_NAN;
            } else {
                char *ep;
                value_expected = 1;
                int_value_expected = 1;
                if (strcmp(pclass, "FP_ILOGB0") == 0) {
                    e_value = FP_ILOGB0;
                } else if (strcmp(pclass, "FP_ILOGBNAN") == 0) {
                    e_value = FP_ILOGBNAN;
                } else if (strcmp(pclass, "INT_MAX") == 0) {
                    e_value = INT_MAX;
                } else {
                    e_value = strtod(pclass, &ep);
                    if (*ep != '\0') {
                        fprintf(stderr, "ep=%s\n", ep);
                        usage(argv[0], "Unrecognized class value");
                    }
                    if (islessgreater(remainder(e_value, 1.0), 0.0))
                        int_value_expected = 0;
                }
            }
            }
            break;

        default:
            usage(argv[0], NULL);
            exit(EXIT_test_setup_failed);
        }
    }

    assert(argc == optind - 1 + 3);
    x = string_to_d(argv[optind]);
    y =  string_to_d(argv[optind+1]) ;

    clearErrors();

    result = pow(x, y);
    checkErrors(&r_errno, &r_except);
    printf("pow(%.17e,%.17e)=%.17e\n", x, y, result);

    printf("%s ", (r_errno == 0) ? "0" :
                  (r_errno == EDOM) ? "EDOM" :
                  (r_errno == ERANGE) ? "ERANGE" : "???errno???");

    printf("%s ", ((r_except & (FE_DIVBYZERO | FE_UNDERFLOW |
                        FE_OVERFLOW | FE_INVALID)) == 0) ? "0" :
                   (r_except & FE_DIVBYZERO) ? "FE_DIVBYZERO" :
                   (r_except & FE_UNDERFLOW) ? "FE_UNDERFLOW" :
                   (r_except & FE_OVERFLOW)  ? "FE_OVERFLOW" :
                   (r_except & FE_INVALID)   ? "FE_INVALID" : "???except???");

    int r_class = fpclassify(result);
    int r_sign = signbit(result) ? -1 : 1;

    if (r_class == FP_INFINITE || r_class == FP_ZERO)
        printf("%s", signbit(result) ? "-" : "+");
    printf("%s", (r_class == FP_ZERO) ? "0" :
                  (r_class == FP_NAN) ? "nan" :
                  (r_class == FP_INFINITE) ? "inf" :
                  (r_class == FP_NORMAL) ? "normal" :
                  (r_class == FP_SUBNORMAL) ? "subnormal" : "???class???");


    if (e_opt_present) {
        printf("; ");
        int errno_passed, except_passed, class_passed, all_passed;

        errno_passed = dont_check_errno || (r_errno == e_errno);
        except_passed = dont_check_except ||
                (e_except == 0 && (r_except & ~FE_INEXACT) == 0) ||
                ((r_except & e_except) != 0);
        class_passed = dont_check_class ||
                       (value_expected && int_value_expected &&
                        !isnan(result) && result == e_value) ||
                       (value_expected && !isnan(result) &&
                        fabsl((result - e_value) / e_value) < 1e-5) ||
                       (r_class == e_class &&
                        ((r_class == FP_NAN || r_class == FP_NORMAL ||
                          r_class == FP_SUBNORMAL) ||
                         r_sign == e_sign));

        printf("%s ", (r_errno == e_errno) ? "ok" : "fail-errno");
        printf("%s ", except_passed ? "ok" : "fail-except");
        printf("%s", class_passed ? "ok" : "fail-result");

        all_passed = errno_passed && except_passed && class_passed;

        if (!all_passed)
            exit_status = EXIT_FAILURE;

        printf("; %s", all_passed ? "PASS" : "FAIL");
        if (!all_passed) {
            printf(" (expected: ");
            if (e_errno == 0 && e_except == 0) {
                printf("no-error");
            } else if (e_errno == EDOM && e_except == FE_INVALID) {
                printf("domain-error");
            } else if (e_errno == ERANGE && e_except == FE_OVERFLOW) {
                printf("range-error-overflow");
            } else if (e_errno == ERANGE && e_except == FE_UNDERFLOW) {
                printf("range-error-underflow");
            } else if (e_errno == ERANGE && e_except == FE_DIVBYZERO) {
                printf("pole-error");
            }
            printf(" (%s, %s); %s", perrno, pexcept, pclass);

            printf(")");
        }
    }

    printf("\n\n");
    exit(exit_status);
}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
