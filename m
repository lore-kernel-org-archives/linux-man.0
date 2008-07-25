From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: math_error.7 draft 4, for review
Date: Fri, 25 Jul 2008 12:49:47 +0200
Message-ID: <cfd18e0f0807250349jaa38928kaac968720c377322@mail.gmail.com>
References: <cfd18e0f0807210323m4912a31pa5359c2b7409167c@mail.gmail.com>
	 <cfd18e0f0807210325m7606441as19811b6802661a8c@mail.gmail.com>
	 <m3zlo6b9b8.fsf@gromit.moeb>
	 <cfd18e0f0807250236y476023fan90e97822e772859e@mail.gmail.com>
	 <m37ibab7sr.fsf@gromit.moeb>
	 <cfd18e0f0807250316k4bb6cbd1t8c6f20317f669c4a@mail.gmail.com>
	 <m3y73q9ro3.fsf@gromit.moeb>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m3y73q9ro3.fsf-Qr39nsLl7G5WFLYQ/5USTw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jul 25, 2008 at 12:36 PM, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org> wrote:
> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> Well, for example, according to my tests, cos(3) does not set errno.
>> Is that what you would have expected?
>
> No, I wouldn't.

(Slightly confused here, since you seem to contradict my result, but
then the text below seems to agree with my result.  But maybe I'm just
misreading your text.)

> And double checking, it's the other way round :-(.  We
> test the exception handling, not the error handling, so tests like
> (libc/math/libm-test.inc) these
>
>  TEST_f_f (cos, plus_infty, nan_value, INVALID_EXCEPTION);
>  TEST_f_f (cos, minus_infty, nan_value, INVALID_EXCEPTION);
>
> test that cos with input plus/minus infinity returns a NaN and raises
> and invalid exception which is tested with fetestexcept.  And if you
> have different results, please tell me,

When I run the program belwo, this is what I see for a domain error from cos():

$ ./a.out inf
errno == 0
fetestexcept() says: 1 FE_INVALID
cos(inf)=nan

Cheers,

Michael

/* t_cos.c */
#define _XOPEN_SOURCE 600
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <fenv.h>
#include <math.h>
#include <float.h>
#include <ctype.h>

/* Convert a string to a double, but allow a few special cases
   in the form of non-numeric strings */

static double
strToDouble(char *str)
{
    char *p;
    char *s;
    double retval;

    if (str == NULL) {
        fprintf(stderr, "Missing argument\n");
        exit(EXIT_FAILURE);
    }

    s = strdup(str);
    if (s == NULL) {
        perror("strdup");
        exit(EXIT_FAILURE);
    }

    for (p = s; *p; p++)
        *p = tolower(*p);

    if (strcmp(s, "-inf") == 0)
        retval = -HUGE_VAL;
    else if (strcmp(s, "inf") == 0 || strcmp(s, "+inf") == 0)
        retval = HUGE_VAL;
    else if (strcmp(s, "nan") == 0)
        retval = nan("");
    else if (strcmp(s, "dbl_min") == 0)
        retval = DBL_MIN;
    else if (strcmp(s, "-dbl_min") == 0)
        retval = -DBL_MIN;
    else if (strcmp(s, "dbl_max") == 0)
        retval = DBL_MAX;
    else if (strcmp(s, "-dbl_max") == 0)
        retval = -DBL_MAX;
    else if (strncmp(s, "subnormal", 9) == 0 ||
             strncmp(s, "-subnormal", 10) == 0) {
        char *h;
        int d, j;

        h = strchr(s, ':');
        if (h == NULL)
            d = 4;
        else
            d = atoi(h + 1);
        printf("subnormal denominator is %d\n", 1 << d);
        retval = DBL_MIN;
        for (j = 0; j < d; j++)
            retval /= 2.0;
        if (s[0] == '-')
            retval = -retval;
        printf("Returning %e\n", retval);
    } else if (strchr("+-0123456789", s[0]) == NULL) {
        fprintf(stderr, "Bad argument: %s\n", s);
        exit(EXIT_FAILURE);
    } else
        retval = atof(s);

    free(s);
    return retval;
} /* strToDouble */

static void
clearErrors(void)
{
    errno = 0;
    feclearexcept(FE_ALL_EXCEPT);
}

static void
checkErrors(void)
{
    int s;

    if (errno == 0) {
        fprintf(stderr, "errno == 0\n");
    } else {
        int e = errno;

        perror("errno");
        if (e == EDOM)
            fprintf(stderr, "errno == EDOM\n");
        else if (e == ERANGE)
            fprintf(stderr, "errno == ERANGE\n");
        else
            fprintf(stderr, "errno == %d\n", e);
    }

    s = fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
                         FE_UNDERFLOW | FE_INEXACT);
    printf("fetestexcept() says: %d", s);
    if (s & FE_INVALID)
        printf(" FE_INVALID");
    if (s & FE_DIVBYZERO)
        printf(" FE_DIVBYZERO");
    if (s & FE_OVERFLOW)
        printf(" FE_OVERFLOW");
    if (s & FE_UNDERFLOW)
        printf(" FE_UNDERFLOW");
    if (s & FE_INEXACT)
        printf(" FE_INEXACT");
    printf("\n");
}

int
main(int argc, char *argv[])
{
    double x, r;

    x = strToDouble(argv[1]);

    clearErrors();

    r = cos(x);

    checkErrors();

    printf("cos(%e)=%e\n", x, r);
    exit(EXIT_SUCCESS);
} /* main */
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
