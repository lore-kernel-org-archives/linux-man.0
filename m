From: Ralph Loader <suckfish-OA6R/WnsTSZ02iOg2JU2CQ@public.gmane.org>
Subject: Correction to fopencookie man page.
Date: Sun, 17 Mar 2013 10:40:40 +1300
Message-ID: <20130317104040.b809cbcc32f329b2a0159e16@ihug.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

The fopencookie man page says that cookie_io_functions_t is a C struct:

"struct cookie_io_functions_t { ... };"

That is not quite right, [at least in Fedora glibc-2.16-28.fc18] it is a typedef for an anonymous struct:

"typedef struct { ... } cookie_io_functions_t;"

Cheers,
Ralph.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
