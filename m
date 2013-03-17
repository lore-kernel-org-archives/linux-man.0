From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Correction to fopencookie man page.
Date: Sun, 17 Mar 2013 08:51:06 +0100
Message-ID: <CAKgNAkiEAASSOtcb7cD0kcjBUpkFZXxsZnx9VCTUhaRcmKXCLQ@mail.gmail.com>
References: <20130317104040.b809cbcc32f329b2a0159e16@ihug.co.nz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130317104040.b809cbcc32f329b2a0159e16-OA6R/WnsTSZ02iOg2JU2CQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Loader <suckfish-OA6R/WnsTSZ02iOg2JU2CQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Ralph,

On Sat, Mar 16, 2013 at 10:40 PM, Ralph Loader <suckfish-OA6R/WnsTSZ02iOg2JU2CQ@public.gmane.org> wrote:
> Hi,
>
> The fopencookie man page says that cookie_io_functions_t is a C struct:
>
> "struct cookie_io_functions_t { ... };"
>
> That is not quite right, [at least in Fedora glibc-2.16-28.fc18] it is a typedef for an anonymous struct:
>
> "typedef struct { ... } cookie_io_functions_t;"

Il found it a little unclear your report what fix you'd like to see
precisely. Perhaps it is the patch =below, which I have applied.

Thanks,

Michael


diff --git a/man3/fopencookie.3 b/man3/fopencookie.3
index ed371a3..9582d50 100644
--- a/man3/fopencookie.3
+++ b/man3/fopencookie.3
@@ -107,12 +107,12 @@ The structure is defined as follows
 .in +4n
 .nf

-struct cookie_io_functions_t {
+typedef struct {
     cookie_read_function_t  *read;
     cookie_write_function_t *write;
     cookie_seek_function_t  *seek;
     cookie_close_function_t *close;
-};
+} cookie_io_functions_t;

 .fi
 .in
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
