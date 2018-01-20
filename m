From: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: [man-pages PATCH 4/5] s390_sthyi.2: some minor additions
Date: Sat, 20 Jan 2018 13:01:21 +0100
Message-ID: <20180120120121.GD6287@osiris>
References: <20180114185639.GA23817@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180114185639.GA23817-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Jan 14, 2018 at 07:56:39PM +0100, Eugene Syromyatnikov wrote:
> * man2/s390_sthyi.2 (.SH DESCRIPTION): Document the size of the
> resp_buffer when function_code is 0.
> (.SH NOTES): Document various aspects of the current implementation (the
> lifted requirement for the response buffer alignment, the usage of
> hardware STHYI instruction whether available, the presence of in-kernel
> cache), add description for the documentation URL.
> ---
> +The in-kernel implementation of the function code 0 doesn't require the response
> +buffer to be aligned to a page boundary (in contrast to the STHYI instruction
> +requirement).

Maybe: "When using the system call interface the response buffer doesn't
have to fulfill alignment requirements as described in the STHYI
instruction defintion." ?

> +.PP
> +The in-kernel implementation uses STHYI function whether available.
> +.PP

I don't think this should be described in the man page. This is an
implementation detail that can change at any time.

> +The kernel caches the response (for one second, currently), so the subsequent
> +calls to the system call within may return previously cached values instead.

"The kernel caches the response up to one second. Subsequent system call
invocations may return the cached response." ?

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
