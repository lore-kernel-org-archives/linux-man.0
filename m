From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] errno.3: Add values for all errors
Date: Thu, 23 Nov 2017 01:12:47 -0800
Message-ID: <20171123091247.GA7460@infradead.org>
References: <20171123001545.dp55g3pkdm5bzah3@prism.localdomain>
 <20171123083109.GA25458@infradead.org>
 <f033a61a-f305-689d-b69a-72267ef767c1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f033a61a-f305-689d-b69a-72267ef767c1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Wesley Aptekar-Cassels <w.aptekar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Nov 23, 2017 at 10:07:13AM +0100, Michael Kerrisk (man-pages) wrote:
>        On  Linux, the error numbers that correspond to each symbolic name
>        vary somewhat across architectures.  Therefore, numeric values are
>        not  included in the list of error names below.  On any particular
>        system, one can obtain a list of all symbolic error names and  the
>        corresponding error numbers using the errno(1) command:

What package does the errno command come with?  It would have been very
useful for me multuple times, but doesn't come by default at least on my
Debian stretch system, and a simple apt-cache search didn't find it
either.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
