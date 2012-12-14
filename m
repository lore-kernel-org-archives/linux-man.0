From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] socket.7: Describe sockaddr and sockaddr_storage structures.
Date: Fri, 14 Dec 2012 17:51:16 +0100
Message-ID: <CAKgNAkh7Th9XewEU+Dg=nwLwTE-dwhhARzsW3T+5uTN_SeEcvw@mail.gmail.com>
References: <201211161729.qAGHT2t5015672@94.43.138.210.xn.2iij.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201211161729.qAGHT2t5015672-3Be77hNiKzq6hyM1GC9nJ01gUKqpuoTTXqFh9Ls21Oc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Hideaki,

On Fri, Nov 16, 2012 at 6:29 PM, YOSHIFUJI Hideaki
<yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org> wrote:
> Please review.
>
> sockaddr_storage{}, which is useful for protocol independent
> programming, is not documented at all.
>
> Reference:
>
>         RFC 3542
>
> Signed-off-by: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
> ---
>  man7/socket.7 |   39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/man7/socket.7 b/man7/socket.7
> index ec1054a..50a59bb 100644
> --- a/man7/socket.7
> +++ b/man7/socket.7
> @@ -198,6 +198,45 @@ must be installed via
>  See the
>  .I Signals
>  discussion below.
> +.SS Socket Address Structures
> +.BR connect (2),
> +.BR bind (2),
> +.BR accept (2),
> +.BR getsockname (2),
> +.BR getpeername (2)
> +and other functions take an opaque pointer to struct
> +.IR sockaddr ,
> +which contains at least the following element:
> +.sp
> +.in +4n
> +.nf
> +    sa_family_t sa_family;
> +.fi
> +.in
> +.PP
> +Some socket functions take socket address structure
> +to be filled.  To define unified socket address
> +buffer for multiple protocols, struct
> +.I sockaddr_storage
> +is provided, which contains at least the following element:
> +.sp
> +.in +4n
> +.nf
> +    sa_family_t ss_family;
> +.fi
> +.in
> +.PP
> +.I sockaddr_storage
> +is suitable to accomodate all supported protocol specific socket
> +address structures; it is large enough and is aligned properly.
> +.PP
> +Each socket address structure,
> +.IR sockaddr ,
> +.I sockaddr_storage
> +and others has common initial element of
> +.I sa_family_t
> +type and can be used to determine protocol specific socket
> +address structure.
>  .SS Socket Options
>  These socket options can be set by using
>  .BR setsockopt (2)

Thanks for this patch. I hope you do not mind, but what it inspired me
to do was instead draft a text of my own, which I have applied. Let me
know if you see any problems in the patch below.

Thanks,

Michael


diff --git a/man7/socket.7 b/man7/socket.7
index 2261691..36823ba 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -40,7 +40,7 @@
 .\"            commit 3bdc0eba0b8b47797f4a76e377dd8360f317450f
 .\"            Author: Ben Greear <greearb-my8/4N5VtI7c+919tysfdA@public.gmane.org>
 .\"
-.TH SOCKET 7 2012-07-07 Linux "Linux Programmer's Manual"
+.TH SOCKET 7 2012-12-15 Linux "Linux Programmer's Manual"
 .SH NAME
 socket \- Linux socket interface
 .SH SYNOPSIS
@@ -216,6 +216,54 @@ must be installed via
 See the
 .I Signals
 discussion below.
+.SS Socket address structures
+Each socket domain has its own format for socket addresses,
+with a domain-specific address structure.
+Each of these structures begins with an
+integer "family" field (typed as
+.IR sa_family_t )
+that indicates the type of the address structure.
+This allows
+the various system calls (e.g.,
+.BR connect (2),
+.BR bind (2),
+.BR accept (2),
+.BR getsockname (2),
+.BR getpeername (2)),
+which are generic to all socket domains,
+to determine the domain of a particular socket address.
+
+To allow any type of socket address to be passed to
+interfaces in the sockets API,
+the type
+.IR "struct sockaddr"
+is defined.
+The purpose of this type is purely to allow casting of
+domain-specific socket address types to a "generic" type,
+so as to avoid compiler warnings about type mismatches in
+calls to the sockets API.
+
+In addition, the sockets API provides the data type
+.IR "struct sockaddr_storage".
+This type
+is suitable to accommodate all supported domain-specific socket
+address structures; it is large enough and is aligned properly.
+(In particular, it is large enough to hold
+IPv6 socket addresses.)
+The structure includes the following field, which can be used to identify
+the type of socket address actually stored in the structure:
+
+.in +4n
+.nf
+    sa_family_t ss_family;
+.fi
+.in
+
+The
+.I sockaddr_storage
+structure is useful in programs that must handle socket addresses
+in a generic way
+(e.g., programs that must deal with both IPv4 and IPv6 socket addresses).
 .SS Socket Options
 These socket options can be set by using
 .BR setsockopt (2)



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
