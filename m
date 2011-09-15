From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] hsearch.3: update ERRORS section
Date: Thu, 15 Sep 2011 20:39:21 +0200
Message-ID: <CAKgNAkg0fDJdTiuOB-0Sx+924Bm5OapBQuORN3mfdvL4BY9uww@mail.gmail.com>
References: <4E5E4928.7030301@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4928.7030301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Seonghun,

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why:
> Remove ENOMEM and ESRCH from the list for hcreate() and hcreate_h().
> The (e)glibc implementation of the two functions (of course!) doesn't
> set such errors. The two error codes are garbage from commit fe80e23e.
>
> Then, hdestroy_r() was added to the list.
>
>
> diff --git a/man3/hsearch.3 b/man3/hsearch.3
> --- a/man3/hsearch.3
> +++ b/man3/hsearch.3
> @@ -191,22 +191,16 @@ returns nonzero on success, and 0 on error.
> .SH ERRORS
> .LP
> .BR hcreate ()
> -and
> +,
> .BR hcreate_r ()
> +and
> +.BR hdestroy_r ()
> can fail for the following reasons:
> .TP
> .B EINVAL
> .RB ( hcreate_r ())
> .I htab
> is NULL.
> -.TP
> -.B ENOMEM
> -Table full with \fIaction\fP set to \fBENTER\fP.
> -.TP
> -.B ESRCH
> -The \fIaction\fP argument is \fBFIND\fP and no corresponding element
> -is found in the table.
> -.\" hdestroy_r() can set errno to EINVAL if 'tab' is NULL.
> .PP
> .BR hsearch ()
> and

Thanks. I tweaked your patch a little and applied the version below for 3.33.

Cheers,

Michael


--- a/man3/hsearch.3
+++ b/man3/hsearch.3
@@ -32,7 +32,7 @@
 .\" 2008-09-03, mtk, restructured somewhat, in part after suggestions from
 .\"     Timothy S. Nelson <wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org>
 .\"
-.TH HSEARCH 3 2008-10-06 "GNU" "Linux Programmer's Manual"
+.TH HSEARCH 3 2011-09-10 "GNU" "Linux Programmer's Manual"
 .SH NAME
 hcreate, hdestroy, hsearch, hcreate_r, hdestroy_r,
 hsearch_r \- hash table management
@@ -190,23 +190,14 @@ cannot be found in the hash table.
 returns nonzero on success, and 0 on error.
 .SH ERRORS
 .LP
-.BR hcreate ()
-and
 .BR hcreate_r ()
+and
+.BR hdestroy_r ()
 can fail for the following reasons:
 .TP
 .B EINVAL
-.RB ( hcreate_r ())
 .I htab
 is NULL.
-.TP
-.B ENOMEM
-Table full with \fIaction\fP set to \fBENTER\fP.
-.TP
-.B ESRCH
-The \fIaction\fP argument is \fBFIND\fP and no corresponding element
-is found in the table.
-.\" hdestroy_r() can set errno to EINVAL if 'tab' is NULL.
 .PP
 .BR hsearch ()
 and




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
