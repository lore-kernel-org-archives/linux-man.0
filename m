From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] encrypt.3: wfix phrasing
Date: Mon, 22 Jul 2013 12:47:06 +0200
Message-ID: <51ED0DAA.8090503@gmail.com>
References: <1374477380-7564-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374477380-7564-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 07/22/13 09:16, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>


Thanks. Applied.

Cheers,

Michael



> ---
>  man3/encrypt.3   | 10 +++++-----
>  man3/getgrnam.3  | 10 +++++-----
>  man3/getpwnam.3  | 10 +++++-----
>  man3/getttyent.3 |  8 ++++----
>  man3/hsearch.3   | 10 +++++-----
>  man3/qecvt.3     |  6 +++---
>  man3/ttyslot.3   |  4 ++--
>  7 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/man3/encrypt.3 b/man3/encrypt.3
> index c1580d5..70dd251 100644
> --- a/man3/encrypt.3
> +++ b/man3/encrypt.3
> @@ -27,7 +27,7 @@
>  .\"
>  .\" Modified 2003-04-04, aeb
>  .\"
> -.TH ENCRYPT 3 2013-06-21 "" "Linux Programmer's Manual"
> +.TH ENCRYPT 3 2013-07-22 "" "Linux Programmer's Manual"
>  .SH NAME
>  encrypt, setkey, encrypt_r, setkey_r \- encrypt 64-bit messages
>  .SH SYNOPSIS
> @@ -123,17 +123,17 @@ The function is not provided.
>  (For example because of former USA export restrictions.)
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
> -The functions
> +The
>  .BR encrypt ()
>  and
>  .BR setkey ()
> -are not thread-safe.
> +functions are not thread-safe.
>  .LP
> -The functions
> +The
>  .BR encrypt_r ()
>  and
>  .BR setkey_r ()
> -are thread-safe.
> +functions are thread-safe.
>  .SH CONFORMING TO
>  The functions
>  .BR encrypt ()
> diff --git a/man3/getgrnam.3 b/man3/getgrnam.3
> index fa9a364..cf13595 100644
> --- a/man3/getgrnam.3
> +++ b/man3/getgrnam.3
> @@ -30,7 +30,7 @@
>  .\" Modified 1993-07-24 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Modified 2003-11-15 by aeb
>  .\"
> -.TH GETGRNAM 3 2013-06-21 "" "Linux Programmer's Manual"
> +.TH GETGRNAM 3 2013-07-22 "" "Linux Programmer's Manual"
>  .SH NAME
>  getgrnam, getgrnam_r, getgrgid, getgrgid_r \- get group file entry
>  .SH SYNOPSIS
> @@ -209,17 +209,17 @@ Insufficient buffer space supplied.
>  local group database file
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
> -The functions
> +The
>  .BR getgrnam ()
>  and
>  .BR getgrgid ()
> -are not thread-safe.
> +functions are not thread-safe.
>  .LP
> -The functions
> +The
>  .BR getgrnam_r ()
>  and
>  .BR getgrgid_r ()
> -are thread-safe.
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
>  .SH NOTES
> diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
> index ae986a8..ba55c8d 100644
> --- a/man3/getpwnam.3
> +++ b/man3/getpwnam.3
> @@ -34,7 +34,7 @@
>  .\" Modified 2003-11-15 by aeb
>  .\" 2008-11-07, mtk, Added an example program for getpwnam_r().
>  .\"
> -.TH GETPWNAM 3  2013-06-21 "GNU" "Linux Programmer's Manual"
> +.TH GETPWNAM 3  2013-07-22 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  getpwnam, getpwnam_r, getpwuid, getpwuid_r \- get password file entry
>  .SH SYNOPSIS
> @@ -216,17 +216,17 @@ Insufficient buffer space supplied.
>  local password database file
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
> -The functions
> +The
>  .BR getpwnam ()
>  and
>  .BR getpwuid ()
> -are not thread-safe.
> +functions are not thread-safe.
>  .LP
> -The functions
> +The
>  .BR getpwnam_r ()
>  and
>  .BR getpwuid_r ()
> -are thread-safe.
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
>  The
> diff --git a/man3/getttyent.3 b/man3/getttyent.3
> index 7bf7b3c..93b8a4d 100644
> --- a/man3/getttyent.3
> +++ b/man3/getttyent.3
> @@ -4,7 +4,7 @@
>  .\" Distributed under GPL
>  .\" %%%LICENSE_END
>  .\"
> -.TH GETTTYENT 3 2013-06-21  "GNU" "Linux Programmer's Manual"
> +.TH GETTTYENT 3 2013-07-22  "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  getttyent, getttynam, setttyent, endttyent \- get ttys file entry
>  .SH SYNOPSIS
> @@ -73,17 +73,17 @@ can be:
>  .SS Multithreading (see pthreads(7))
>  The
>  .BR getttyent ()
> -returns a pointer to a static variable, so it is not thread-safe.
> +function returns a pointer to a static variable, so it is not thread-safe.
>  .LP
>  The
>  .BR setttyent ()
>  and
>  .BR endttyent ()
> -use a static variable, so they are not thread-safe.
> +functions use a static variable, so they are not thread-safe.
>  .LP
>  The
>  .BR getttynam ()
> -calls thread-unsafe function
> +function calls thread-unsafe function
>  .BR getttyent ()
>  so it is not thread-safe.
>  .SH CONFORMING TO
> diff --git a/man3/hsearch.3 b/man3/hsearch.3
> index 0b639ce..1b68f02 100644
> --- a/man3/hsearch.3
> +++ b/man3/hsearch.3
> @@ -32,7 +32,7 @@
>  .\" 2008-09-03, mtk, restructured somewhat, in part after suggestions from
>  .\"     Timothy S. Nelson <wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org>
>  .\"
> -.TH HSEARCH 3 2013-04-19 "GNU" "Linux Programmer's Manual"
> +.TH HSEARCH 3 2013-07-22 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  hcreate, hdestroy, hsearch, hcreate_r, hdestroy_r,
>  hsearch_r \- hash table management
> @@ -230,19 +230,19 @@ POSIX.1-2001 specifies only the
>  error.
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
> -The functions
> +The
>  .BR hcreate (),
>  .BR hsearch (),
>  and
>  .BR hdestroy ()
> -use a global space for storing the table, so they are not thread-safe.
> +functions use a global space for storing the table, so they are not thread-safe.
>  .LP
> -The functions
> +The
>  .BR hcreate_r (),
>  .BR hsearch_r (),
>  and
>  .BR hdestroy_r ()
> -are thread-safe.
> +functions are thread-safe.
>  .SH CONFORMING TO
>  The functions
>  .BR hcreate (),
> diff --git a/man3/qecvt.3 b/man3/qecvt.3
> index 5c26b3b..88b4c5a 100644
> --- a/man3/qecvt.3
> +++ b/man3/qecvt.3
> @@ -25,7 +25,7 @@
>  .\" This replaces an earlier man page written by Walter Harms
>  .\" <walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org>.
>  .\"
> -.TH QECVT 3  2013-06-21 "GNU" "Linux Programmer's Manual"
> +.TH QECVT 3  2013-07-22 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  qecvt, qfcvt, qgcvt \- convert a floating-point number to a string
>  .SH SYNOPSIS
> @@ -71,11 +71,11 @@ and
>  .BR gcvt (3).
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
> -The functions
> +The
>  .BR qecvt ()
>  and
>  .BR qfcvt ()
> -are not thread-safe.
> +functions are not thread-safe.
>  .LP
>  The
>  .BR qgcvt ()
> diff --git a/man3/ttyslot.3 b/man3/ttyslot.3
> index 92f393e..2d9fa15 100644
> --- a/man3/ttyslot.3
> +++ b/man3/ttyslot.3
> @@ -25,7 +25,7 @@
>  .\" This replaces an earlier man page written by Walter Harms
>  .\" <walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org>.
>  .\"
> -.TH TTYSLOT 3 2013-06-21 "GNU" "Linux Programmer's Manual"
> +.TH TTYSLOT 3 2013-07-22 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  ttyslot \- find the slot of the current user's terminal in some file
>  .SH SYNOPSIS
> @@ -124,7 +124,7 @@ but \-1 on System V-like systems.
>  .SS Multithreading (see pthreads(7))
>  The
>  .BR ttyslot ()
> -calls thread-unsafe function
> +function calls thread-unsafe function
>  .BR getttyent (),
>  so it is not thread-safe.
>  .SH CONFORMING TO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
