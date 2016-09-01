From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Some bookmarks in the top navigation of man-pages can't jump
 corresponding position
Date: Thu, 1 Sep 2016 14:59:19 +1200
Message-ID: <CAKgNAkiL93dP9+myfq7EGGHBAW29b1FjiZUJbqdj38VnwFznVA@mail.gmail.com>
References: <CAL_3=-AR0kbx1YkZyxbbbsYztTnFfc4mWOY5kKD_hF-Xkf9h0w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_3=-AR0kbx1YkZyxbbbsYztTnFfc4mWOY5kKD_hF-Xkf9h0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Debugfan Chin <debugfanchin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 31 August 2016 at 22:28, Debugfan Chin <debugfanchin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I found occasionally some bookmarks such as "RETURN VALUE", "CONFORMING TO"
> in navigation doesn't work when I visited the web page
> "http://man7.org/linux/man-pages/man2/fork.2.html". And then I tested some
> other pages, they seem to have the same problem.
> I checked the page source and found: the code of the bookmark "RETURN VALUE"
> is
> <a href="#RETURN&nbsp;VALUE">RETURN&nbsp;VALUE</a>,
> but the code of the corresponding position is
> <h2><a id="RETURN_VALUE" href="#RETURN_VALUE">.
> As show as above, the "#RETURN&nbsp;VALUE" is not matched with
> "RETURN_VALUE", so the jump inside the page doesn't work. The "CONFORMING
> TO" is similar.

Thanks! Fixed now.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
