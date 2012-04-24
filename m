From: Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org>
Subject: Re: [PATCH] Explain how to read a single inotify event.
Date: Tue, 24 Apr 2012 18:11:12 +0000
Message-ID: <20120424181112.GA1458@dcvr.yhbt.net>
References: <4EDDE325.2080203@ubuntu.com>
 <CAKgNAkgB3_SUsnH0-c8X6Lute8amtEkw0VtrsCqFGWn+c4yfQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgB3_SUsnH0-c8X6Lute8amtEkw0VtrsCqFGWn+c4yfQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> My question is, why do you want to propose this technique for reading
> a *single* event.?

It could be useful in multithreaded/multiprocess apps that rely on an
inotify descriptor to distribute work to a thread pool.  accept() and
mq_receive() users do it all the time.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
