From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: [PATCH] open,linkat: Update AT_EMPTY_PATH and O_PATH documentation
Date: Fri, 9 Aug 2013 11:59:31 -0700
Message-ID: <CALCETrWMahqsTEwzvMF2_c7YpgBkrZRkTHtNDVzFsQJ_R=++GA@mail.gmail.com>
References: <818bf4803d4c8d20fa78a485bc57f8240a4f89b8.1376074657.git.luto@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <818bf4803d4c8d20fa78a485bc57f8240a4f89b8.1376074657.git.luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Aug 9, 2013 at 11:58 AM, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> wrote:
> The current text reflects the general worry in the kernel about
> recipients of O_PATH fds being able to hardlink the referenced files.
> It turns out that it was possible to link these files regardless of
> any possible security concerns.
>
> Linux 3.11 removes the capability chech in AT_EMPTY_PATH.  I expect
> that this functionality will be generally useful, so let's document it
> better.
>
> Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>

For reference, the relevant change is:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=bb2314b47996491bbc5add73633905c3120b6268

Also, I can't spell "check".  Oh, well.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
