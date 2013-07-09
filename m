From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PTHREAD_CLEANUP_PUSH_DEFER_NP(3)
Date: Tue, 9 Jul 2013 04:34:08 +0200
Message-ID: <CAKgNAkimJbCdJ6W_+1qaM1KpCxFAN5EfzbMF_PDBC7vcXcb6dA@mail.gmail.com>
References: <51D588FC.6070701@embedded-brains.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51D588FC.6070701-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Huber <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Sebastian,

On Thu, Jul 4, 2013 at 4:38 PM, Sebastian Huber
<sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org> wrote:
> Hello,
>
> I think there is an error in the description
>
>        is equivalent to (but shorter and more efficient than):
>
>            int oldtype;
>
>            pthread_cleanup_push(routine, arg);
>            pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldtype);
>            ...
>            pthread_setcanceltype(oldtype, NULL);
>            pthread_cleanup_pop(execute);
>
> this should be instead
>
>        is equivalent to (but shorter and more efficient than):
>
>            int oldtype;
>
>            pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldtype);
>            pthread_cleanup_push(routine, arg);
>            ...
>            pthread_cleanup_pop(execute);
>            pthread_setcanceltype(oldtype, NULL);


I am doubtful of this, but, can you provide some evidence to support your claim?

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
