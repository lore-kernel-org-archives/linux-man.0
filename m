From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: bug in execl(3)
Date: Sun, 11 Sep 2011 16:59:16 +0200
Message-ID: <CAKgNAkjC4qqGZCwMkLST7P78z6_tQ6DXpHoDbxC3DoRPDsBf2w@mail.gmail.com>
References: <BLU125-W860BE16AA8A7DC1A637B7FCB40@phx.gbl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLU125-W860BE16AA8A7DC1A637B7FCB40-MsuGFMq8XAE@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Mathys <antoine_mathys-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Antoine,

On Tue, Mar 22, 2011 at 3:23 AM, Antoine Mathys
<antoine_mathys-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> The file and path argument names in the prototypes are in the wrong places.
>
> current version:
>
> int execl(const char *path, const char *arg, ...);
> int execlp(const char *file, const char *arg, ...);
> int execle(const char *path, const char *arg,
>            ..., char * const envp[]);
> int execv(const char *path, char *const argv[]);
> int execvp(const char *file, char *const argv[]);
> int execvpe(const char *file, char *const argv[],
>             char *const envp[]);
>
> correct version:
>
> int execl(const char *file, const char *arg, ...);
> int execlp(const char *path, const char *arg, ...);
> int execle(const char *file, const char *arg,
>            ..., char * const envp[]);
> int execv(const char *file, char *const argv[]);
> int execvp(const char *path, char *const argv[]);
> int execvpe(const char *path, char *const argv[],
>             char *const envp[]);
>
> It is a minor bug but it is confusing.

As far as I can see, the existing page is correct. But perhaps somehow
something is not clearly explained. Can you say more about why you
think the page is wrong?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
