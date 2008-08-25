From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Math error-reporting test scripts useful in glibc?
Date: Mon, 25 Aug 2008 10:49:33 +0200
Message-ID: <cfd18e0f0808250149pd84615fo4d22a30f0a3bd54@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
Cc: "Joseph S. Myers" <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

A few weeks back I wrote some scripts to test error reporting by
nearly all math functions in glibc.  (Some details below.)  These
scripts are available here:
http://linux-man-pages.blogspot.com/2008/08/help-request-testing-of-math-function.html.

The main points about these scripts are that:

a) They automate generation of test programs for math functions, so
that together two scripts generate tests for about 70 math functions
(in any of the three type flavors, float, double, and long double).

b) They produce C programs that can be driven from the command-line to
perform almost any test of the math function.  Thus, as well as
accepting numeric vales for the function arguments, one can use words
such as "+inf", "-inf", "nan", "max" (the largest value of the
function's type), "subnormal:N" (a subnormal power-of-two number with
N leading zeroes in the significand), etc.  The resulting programs can
be useful for working with glibc bug reports for math functions where
no test program is supplied, or the test program is very limited in
its operation.

c) The generated test programs produce output that can easily be
script processed -- each program produces a summary line containing
the errno setting, the exception raised (if any), and the (class of
the) result value.  For example, the log(3) test program produces the
following output when given a command-line argument of 0:
ERANGE FE_DIVBYZERO -inf
And an argument of 10 produces the output:
0 0 normal
(where normal is indicates that the result is a normalized floating
point number; it is also possible to use the programs to test that the
result matches a specific value, if merely knowing that the value is
"normal" is insufficient).

d) They can be extended fairly easily to cover other math functions
(though in fact I think I've covered most math functions already,
including all of those in POSIX.1-2001, and most of the glibc
extensions -- however, note that these scripts don't deal with the
complex math functions).

My question is: would / could these tests be usefully integrated into
glibc?  If necessary, I may have some time to do some reworking to
make them more suited to glibc requirements.

Cheers,

Michael

PS The scripts check things such as:

* Are errors reported via errno, via exceptions, or both?  For cases
where errors are reported using only one of these mechanisms, or
reported the wrong errors (see next point) or where errors are not
reported at all, I logged bugs  --
http://thread.gmane.org/gmane.comp.lib.glibc.alpha/13583/focus=13594 .
 The results of my tests are here:
http://linux-man-pages.blogspot.com/2008/08/math-functions-and-error-reporting.html
.)

* Do the functions report errors for the appropriate cases (e.g.,
underflow overflow, domain error, pole error), and (more difficult to
determine, so not complete) are there cases where errors are being
reported when they shouldn't be?

* Are errors reported correctly?  (i.e., is errno set to the right
value, or is the correct exception raised)?

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
