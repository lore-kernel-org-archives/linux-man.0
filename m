From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strerror: improve strerror_r description
Date: Sun, 22 Apr 2012 12:19:32 +1200
Message-ID: <CAKgNAkhJDrjrTJJKxubkJ2CMmoB0HBPHWmG2PWJpg7DKMcKWnw@mail.gmail.com>
References: <1300400795-9123-1-git-send-email-eblake@redhat.com>
 <AANLkTim_cCxXXGE_BgSV5ewEQziru=gH0LpeFAWRWdkb@mail.gmail.com> <4D8BAEBD.4080202@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D8BAEBD.4080202-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Eric,

On Fri, Mar 25, 2011 at 9:51 AM, Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 03/18/2011 03:35 AM, Stefan Puiu wrote:
>>> Signed-off-by: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> [...]
>>>
>>> http://sourceware.org/bugzilla/show_bug.cgi?id=3D12204
>>> documents glibc's change to come into compliance with POSIX
>>> regarding strerror_r return value. =A0The GNU strerror_r use
>>> of buf was confusing - I ended up writing a test program that
>>> proves that buf is unused for valid errnum, but contains
>>> truncated "unknown message" for out-of-range errnum.
>>
>
>>> +on error, glibc 2.13 returns a positive error number, while
>>> +older versions returned \-1 and set
>>> =A0.I errno
>>> -is set to indicate the error.
>>> +indicate the error instead.
>>
>> to indicate the error instead?
>
> Yes.
>
>>
>>> =A0.SH ERRORS
>>> =A0.TP
>>> =A0.B EINVAL
>>> @@ -165,6 +168,7 @@ On some systems,
>>> =A0.\" e.g., Solaris 8, HP-UX 11
>>> =A0.BR strerror ()
>>> =A0returns NULL if the error number is unknown.
>>> +POSIX.1-2008 requires the result to be non-NULL for all inputs.
>>
>> Maybe you could mention C99 as well, since you were saying it also
>> mandates this behavior?
>
> Would make sense. =A0Do you need me to resubmit with those correction=
s, or
> can you squash it in yourself when applying?
>
>> Otherwise, the patch looks ok to me.

Thanks for this patch. I happened to apply another fix from Bernhard
Walle just beforehand, so modified your patch slightly (and included
Stefan's input), to the following:

=3D=3D=3D=3D=3D
--- a/man3/strerror.3
+++ b/man3/strerror.3
@@ -71,10 +71,10 @@ code passed in the argument \fIerrnum\fP, possibly =
using the
 part of the current locale to select the appropriate language.
 This string must not be modified by the application, but may be
 modified by a subsequent call to
-.BR perror (3)
-or
 .BR strerror ().
-No library function will modify this string.
+No library function, including
+.BR perror (3),
+will modify this string.

 The
 .BR strerror_r ()
@@ -84,7 +84,7 @@ but is
 thread safe.
 This function is available in two versions:
 an XSI-compliant version specified in POSIX.1-2001
-(available since glibc 2.3.4),
+(available since glibc 2.3.4, but not POSIX-compliant until glibc 2.13=
),
 and a GNU-specific version (available since glibc 2.0).
 The XSI-compliant version is provided with the feature test macros
 settings shown in the SYNOPSIS;
@@ -120,7 +120,10 @@ then at most
 .I buflen
 bytes are stored (the string may be truncated if
 .I buflen
-is too small) and the string always includes a terminating null byte.
+is too small and
+.I errnum
+is unknown).
+The string always includes a terminating null byte.
 .SH "RETURN VALUE"
 The
 .BR strerror ()
@@ -132,8 +135,12 @@ or an "Unknown error nnn" message if the error
number is unknown.

 The XSI-compliant
 .BR strerror_r ()
-function returns 0 on success;
-on error, a (positive) error number is returned.
+function returns 0 on success.
+On error,
+a (positive) error number is returned (since glibc 2.13),
+or \-1 is returned and
+.I errno
+is set to indicate the error (glibc versions before 2.13).
 .SH ERRORS
 .TP
 .B EINVAL
@@ -171,6 +178,7 @@ returns a string something like "Error nnn
occurred" and sets
 to
 .B EINVAL
 if the error number is unknown.
+C99 and POSIX.1-2008 require the return value to be non-NULL.
 .SH "SEE ALSO"
 .BR err (3),
 .BR errno (3),
=3D=3D=3D=3D=3D

In addition to the above, I added the following, and I'd be happy if
you could ack it.

=3D=3D=3D=3D=3D
--- a/man3/strerror.3
+++ b/man3/strerror.3
@@ -133,6 +133,19 @@ functions return
 the appropriate error description string,
 or an "Unknown error nnn" message if the error number is unknown.

+POSIX.1-2001 and POSIX.1-2008 require that a successful call to
+.BR strerror (3)
+shall leave
+.I errno
+unchanged, and note that,
+since no function return value is reserved to indicate an error,
+an application that wishes to check for errors should initialize
+.I errno
+to zero before the call,
+and then check
+.I errno
+after the call.
+
 The XSI-compliant
 .BR strerror_r ()
 function returns 0 on success.
=3D=3D=3D=3D=3D

These changes will be in man-pages-3.40.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
